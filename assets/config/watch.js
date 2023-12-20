const path = require("path");
const chokidar = require("chokidar");
const livereload = require("livereload");

const { templateCompile, scriptCompile } = require("./compilers");

function initialRun() {
  templateCompile();
  scriptCompile();
}

const templateWatcher = chokidar.watch(
  path.join(__dirname, "..", "src", "templates")
);

const scriptWatcher = chokidar.watch(
  path.join(__dirname, "..", "src", "scripts")
);

templateWatcher.on("ready", function () {
  templateWatcher.on("all", templateCompile);
});

scriptWatcher.on("ready", function () {
  scriptWatcher.on("all", scriptCompile);
});

livereload.createServer().watch(path.join(__dirname, "..", "public"));

console.log("Template watcher and livereload server have been started");

initialRun();
