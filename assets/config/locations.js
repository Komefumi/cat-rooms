const path = require("path");

const envPath = path.join(__dirname, "..", "..", ".env");
const srcDir = path.join(__dirname, "..", "src");
const srcTemplates = path.join(srcDir, "templates");
const srcScripts = path.join(srcDir, "scripts");
const srcStyles = path.join(srcDir, "styles");
const srcImages = path.join(srcDir, "images");
const publicDir = path.join(__dirname, "..", "public");
const publicScriptsDir = path.join(publicDir, "scripts");
const publicCSSDir = path.join(publicDir, "css");
const publicImagesDir = path.join(publicDir, "images");

module.exports = {
  envPath,
  srcDir,
  srcTemplates,
  srcScripts,
  srcStyles,
  srcImages,
  publicDir,
  publicScriptsDir,
  publicCSSDir,
  publicImagesDir,
};
