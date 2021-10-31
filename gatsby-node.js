var path = require("path");
exports.onCreateWebpackConfig = ({ actions }) => {
  actions.setWebpackConfig({
    module: {
      rules: [
        {
          test: /\.purs$/i,
          include: path.resolve(__dirname, "src/FPSound"),
          type: "asset/source",
        },
      ],
    },
  });
};
