const path = require("path");
const chokidar = require("chokidar");

const templateComplier = require("./templates");

const templateWatcher = chokidar.watch(
  path.join(__dirname, "..", "src", "templates")
);

templateWatcher.on("ready", function () {
  templateWatcher.on("all", templateComplier);
});
