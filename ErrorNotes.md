1. If you have bugs, you might not have any output from webpack. If you're running the node API, you have to explicitly log out result. Error alone might not work
1. If you don't have typescript extensions in the resolve field, and are having typescript as entry files, you might run into this aforementioned phenomenon
1. If you have a \*.d.ts alongside the tsconfig.json file, you might run into this issue. This might be a ts-loader related issue. Might want to look at [this](https://github.com/TypeStrong/ts-loader/issues/767)
