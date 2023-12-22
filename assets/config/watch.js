const path = require("path");
const chokidar = require("chokidar");
const livereload = require("livereload");

const { templateCompile, scriptCompile, styleCompile } = require("./compilers");

function initialRun() {
  templateCompile();
  scriptCompile();
  styleCompile();
}

const templateWatcher = chokidar.watch(
  path.join(__dirname, "..", "src", "templates")
);

const scriptWatcher = chokidar.watch(
  path.join(__dirname, "..", "src", "scripts")
);

const styleWatcher = chokidar.watch(
  path.join(__dirname, "..", "src", "styles")
);

templateWatcher.on("ready", function () {
  templateWatcher.on("all", templateCompile);
});

scriptWatcher.on("ready", function () {
  scriptWatcher.on("all", scriptCompile);
});

styleWatcher.on("ready", function () {
  styleWatcher.on("all", styleCompile);
});

livereload.createServer().watch(path.join(__dirname, "..", "public"));

console.log("Template watcher and livereload server have been started");

initialRun();
