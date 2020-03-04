"use strict";

const Promise = require("bluebird");
const getos = Promise.promisify(require("getos"));
const globby = require("globby");
const prompt = require("multiselect-prompt");
const path = require("path");
const execa = require("execa");
const fs = Promise.promisifyAll(require("fs"));

async function main ([node, script, searchpath]) {
	const os = await getos();
	for (const p in os) {
		process.env[p] = os[p];
	}
	console.log("Environment: ", os);
	const searchpaths = [
		"all",
		...Object.values(os)
	].map(p => `${searchpath}/${p}`);

	const featurePaths = (await globby(
		searchpaths.map(p => p + "/*"),
		{
			onlyDirectories: true
		}
	)).sort();
	const uniqueFeatures = {};
	for (const featurePath of featurePaths) {
		const featureName = path.basename(featurePath);
		uniqueFeatures[featureName] = 1;
	}

	const currentSettings = {
		"base-packages": true,
		"base-desktop": true
	};

	const settingsPath = path.join(process.env.HOME, ".os-install");

	try {
		await fs.accessAsync(settingsPath, fs.constants.F_OK);
		const storedSettings = JSON.parse(await fs.readFileAsync(settingsPath));
		for (const setting of storedSettings) {
			currentSettings[setting.value] = setting.selected
		}
	} catch (err) {
		/* oh well */
	}

	const promptOptions = Object.keys(uniqueFeatures).sort().map(feat => {
		return {
			title: feat,
			value: feat,
			selected: currentSettings[feat] === true
		};
	});


	let i = 0;
	const selectedResults = (await new Promise((resolve, reject) => {
		prompt("Select Features", promptOptions)
			.on("abort", () => reject(new Error("Feature Select aborted.")))
			.on("submit", (res) => resolve(res));
	})).map((res) => {
		return {
			...promptOptions[i++],
			...res
		};
	});

	await fs.writeFileAsync(settingsPath, JSON.stringify(selectedResults));

	const featureSearchPaths = [];
	for (const searchpath of searchpaths) {
		for (const feature of selectedResults.filter(v => v.selected)) {
			featureSearchPaths.push(`${searchpath}/${feature.value}`);
		}
	}

	const allSearchPaths = [
		...searchpaths,
		...featureSearchPaths
	];

	const configurationFiles = (await globby(
		allSearchPaths.map(p => p + "/*"),
		{ onlyFiles: true }
	)).sort((a, b) => {
		return [path.basename(a), path.basename(b)].sort()[0] === path.basename(a) ? -1 : 1;
	});

	for (const file of configurationFiles) {
		console.log("Executing", file);
		const proc = execa(file, [], {
			stdio: "inherit"
		});
		await proc;
	}

}

main(process.argv).catch(console.error);
