import path from "path";
import dotenv from "dotenv";

import {
  envPath,
  srcDir,
  srcImages,
  publicCSSDir,
  publicImagesDir,
  publicScriptsDir,
  publicDir,
} from "./locations.js";

dotenv.config({ path: envPath });
import fs from "fs";
import prettier from "prettier";
import ejs from "ejs";
import webpack from "webpack";
import * as sass from "sass-embedded";
import imagemin from "imagemin";
import imageminPngquant from "imagemin-pngquant";
import imageminSvgo from "imagemin-svgo";

const srcImagesGlob = srcImages + "/**/*.{jpg,JPG,jpeg,JPEG,png,svg,gif}";

[publicScriptsDir, publicCSSDir].forEach((pathItem) => {
  if (!fs.existsSync(pathItem)) {
    fs.mkdirSync(pathItem, { recursive: true });
  }
});

const templateToData = {
  index: {
    title: "Cat Rooms",
    styles: ["home"],
  },
  login: {
    title: "Login",
    styles: ["login"],
  },
  register: {
    title: "Register",
    styles: ["register"],
  },
  profile: {
    title: "Profile",
    styles: ["profile"],
  },
};

async function templateCompile() {
  console.log("template compilation triggered");
  const templateDir = path.join(srcDir, "templates");
  const dirContent = fs.readdirSync(templateDir);
  const views = dirContent.filter((item) => item.startsWith("_"));
  dirContent
    .filter((item) => !item.startsWith("_"))
    .forEach(async (fileName) => {
      const name = fileName.split(".")[0];
      const templatePath = path.join(templateDir, fileName);
      const html = await prettier.format(
        await ejs.renderFile(templatePath, templateToData[name], { views }),
        { parser: "html" }
      );
      fs.writeFileSync(path.join(publicDir, name + ".html"), html);
    });
}

async function styleCompile() {
  console.log("style compilation triggered");
  const styleDir = path.join(srcDir, "styles");
  const dirContent = fs.readdirSync(styleDir);
  dirContent
    .filter((item) => !item.startsWith("_"))
    .forEach(async (fileName) => {
      const stylePath = path.join(styleDir, fileName);
      const compileResult = await sass.compileAsync(stylePath);
      const cssResult = await prettier.format(compileResult.css, {
        parser: "css",
      });
      fs.writeFileSync(
        path.join(publicCSSDir, fileName.split(".")[0] + ".css"),
        cssResult
      );
    });
}

async function scriptCompile() {
  console.log("script compilation triggered");

  const scriptDir = path.join(srcDir, "scripts");
  const dirContent = fs.readdirSync(scriptDir);
  const entryFileList = dirContent.filter(
    (item) =>
      !item.startsWith("_") && !item.endsWith(".d.ts") && item.endsWith(".ts")
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
      path: publicScriptsDir,
    },
    mode: "production",
    devtool: "source-map",
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
        {
          test: /\.svg$/i,
          type: "asset/source",
          loader: "svgo-loader",
        },
      ],
    },
    resolve: {
      extensions: [".tsx", ".ts", ".js", ".json", ".svg"],
    },
    plugins: [
      new webpack.DefinePlugin({
        "process.env": JSON.stringify({
          BACKEND_PATH: `http://localhost:${process.env.SERVER_PORT}`,
        }),
      }),
    ],
  });
  webpackCompiler.run((err, result) => {
    if (err) {
      console.log(err);
      return;
    }
    console.log(result);

    webpackCompiler.close((closeErr) => {
      if (closeErr) {
        console.log(closeErr);
      }
    });
  });
}

async function imageCompress() {
  console.log("image compression triggered");
  await imagemin([srcImagesGlob], {
    destination: publicImagesDir,
    plugins: [
      imageminPngquant({
        quality: [0.6, 0.8],
      }),
      imageminSvgo({
        plugins: [
          {
            name: "removeViewBox",
            active: false,
          },
        ],
      }),
    ],
  });
}

export { templateCompile, scriptCompile, styleCompile, imageCompress };
