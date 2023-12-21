const path = require("path");
require("dotenv").config({ path: path.join(__dirname, "..", "..", ".env") });
const prettier = require("prettier");
const fs = require("fs");
const ejs = require("ejs");
const webpack = require("webpack");

const srcDir = path.join(__dirname, "..", "src");
const publicDir = path.join(__dirname, "..", "public");
const publicScriptDir = path.join(publicDir, "scripts");

async function templateCompile() {
  console.log("template compilation triggered");
  const templateDir = path.join(srcDir, "templates");
  const dirContent = fs.readdirSync(templateDir);
  const views = dirContent.filter((item) => item.startsWith("_"));
  dirContent
    .filter((item) => !item.startsWith("_"))
    .forEach(async (fileName) => {
      const templatePath = path.join(templateDir, fileName);
      const html = await prettier.format(
        await ejs.renderFile(templatePath, { title: "placeholder" }, { views }),
        { parser: "html" }
      );
      fs.writeFileSync(
        path.join(__dirname, "..", "public", fileName.split(".")[0] + ".html"),
        html
      );
    });
}

async function scriptCompile() {
  console.log("script compilation triggered");

  const scriptDir = path.join(srcDir, "scripts");
  const dirContent = fs.readdirSync(scriptDir);
  const entryFileList = dirContent.filter(
    (item) => !item.startsWith("_") && item.endsWith(".ts")
  );
  const entryFilePathMapping = entryFileList.reduce((mapping, fileName) => {
    const key = fileName.split(".")[0];
    mapping[key] = path.join(scriptDir, fileName);
    return mapping;
  }, {});
  const webpackCompiler = webpack({
    entry: entryFilePathMapping,
    output: {
      filename: "[name].bundle.js",
      path: publicScriptDir,
    },
    module: {
      rules: [
        {
          test: /\.tsx?$/,
          use: [
            {
              loader: "ts-loader",
              options: {
                configFile: path.join(scriptDir, "tsconfig.json"),
              },
            },
          ],
          exclude: /node_modules/,
        },
      ],
    },
    resolve: {
      extensions: [".tsx", ".ts", ".js"],
    },
    plugins: [
      new webpack.DefinePlugin({
        "process.env.BACKEND_PATH": `http://localhost:${process.env.SERVER_PORT}`,
      }),
    ],
  });
  webpackCompiler.run((err, result) => {
    if (err) {
      console.log(err);
      return;
    }

    webpackCompiler.close((closeErr) => {
      if (closeErr) {
        console.log(closeErr);
      }
    });
  });
}

module.exports = {
  templateCompile,
  scriptCompile,
};
