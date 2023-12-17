const path = require("path");
const chokidar = require("chokidar");
const livereload = require("livereload");

const templateComplier = require("./templates");

const templateWatcher = chokidar.watch(
  path.join(__dirname, "..", "src", "templates")
);

templateWatcher.on("ready", function () {
  templateWatcher.on("all", templateComplier);
});

livereload.createServer().watch(path.join(__dirname, "..", "public"));

console.log("Template watcher and livereload server have been started");
