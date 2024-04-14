const {
  withAndroidManifest,
  AndroidConfig,
  createRunOncePlugin,
  withAppBuildGradle,
} = require("@expo/config-plugins");
const { resolve } = require("path");
const pkg = require("./package.json");

function addDependencies(buildGradle) {
  // 添加需要的仓库地址到repositories部分
  const newDependencies = `
  implementation fileTree(includes: ['*.aar'],dir: "${resolve(
    __dirname + "/android/libs"
  ).replace(/\\/g, "\\\\")}")
  `;
  const pattern = /dependencies\s*{\s*/;
  const match = buildGradle.match(pattern);
  if (match) {
    const index = match.index + match[0].length;
    return (
      buildGradle.slice(0, index) + newDependencies + buildGradle.slice(index)
    );
  } else {
    return buildGradle + "\n" + newDependencies;
  }
}
function hasDependencies(buildGradle) {
  if (
    buildGradle.includes(
      resolve(__dirname + "/android/libs").replace(/\\/g, "\\\\")
    )
  ) {
    return true;
  } else {
    return false;
  }
}

const withKey = (config, { appkey, reward }) => {
  config = withAndroidManifest(config, (config) => {
    config.modResults.manifest.application[0].$["android:allowBackup"] = false;
    const mainApplication = AndroidConfig.Manifest.getMainApplicationOrThrow(
      config.modResults
    );
    AndroidConfig.Manifest.addMetaDataItemToMainApplication(
      mainApplication,
      "ADSET_APP",
      appkey
    );
    AndroidConfig.Manifest.addMetaDataItemToMainApplication(
      mainApplication,
      "ADSET_REWARD",
      reward
    );
    return config;
  });
  config = withAppBuildGradle(config, async (config) => {
    if (!hasDependencies(config.modResults.contents)) {
      config.modResults.contents = addDependencies(config.modResults.contents);
    }
    return config;
  });
  return config;
};

exports.default = createRunOncePlugin(withKey, pkg.name, pkg.version);