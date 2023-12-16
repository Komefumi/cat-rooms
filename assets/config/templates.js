const path = require("path");
const prettier = require("prettier");
const fs = require("fs");
const ejs = require("ejs");

async function compile() {
  console.log("template compilation triggered");
  const templateDir = path.join(__dirname, "..", "src", "templates");
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

module.exports = compile;
