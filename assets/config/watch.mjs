import chokidar from "chokidar";
import livereload from "livereload";

import { templateCompile, scriptCompile, styleCompile } from "./compilers.mjs";
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
}

const templateWatcher = chokidar.watch(srcTemplates);
const scriptWatcher = chokidar.watch([srcScripts, srcImages]);
const styleWatcher = chokidar.watch(srcStyles);

templateWatcher.on("ready", function () {
  templateWatcher.on("all", templateCompile);
});
scriptWatcher.on("ready", function () {
  scriptWatcher.on("all", scriptCompile);
});
styleWatcher.on("ready", function () {
  styleWatcher.on("all", styleCompile);
});

livereload.createServer().watch(publicDir);

console.log("Template watcher and livereload server have been started");

initialRun();
