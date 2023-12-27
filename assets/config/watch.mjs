import path from "path";
import chokidar from "chokidar";
import livereload from "livereload";

import {
  templateCompile,
  scriptCompile,
  styleCompile,
  imageCompress,
} from "./compilers.mjs";
import {
  srcTemplates,
  srcScripts,
  srcStyles,
  srcImages,
  publicDir,
} from "./locations.js";

function initialRun() {
  templateCompile();
  scriptCompile();
  styleCompile();
  imageCompress();
}

const templateWatcher = chokidar.watch(srcTemplates);
const scriptWatcher = chokidar.watch(srcScripts);
const styleWatcher = chokidar.watch(srcStyles);
const imageWatcher = chokidar.watch(srcImages);

templateWatcher.on("ready", function () {
  templateWatcher.on("all", templateCompile);
});
scriptWatcher.on("ready", function () {
  scriptWatcher.on("all", scriptCompile);
});
styleWatcher.on("ready", function () {
  styleWatcher.on("all", styleCompile);
});
imageWatcher.on("ready", function () {
  imageWatcher.on("all", imageCompress);
});

livereload.createServer().watch(publicDir);

console.log("Template watcher and livereload server have been started");

initialRun();
