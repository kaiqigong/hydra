module.exports = {
  entry: "./entry.coffee",
  output: {
    path: __dirname,
    filename: "bundle.js"
  },
  module: {
    loaders: [
    { test: /\.less$/, loader: "style!css!less" },
    { test: /\.coffee$/, loader: "coffee-loader" },
    { test: /\.(coffee\.md|litcoffee)$/, loader: "coffee-loader?literate" }
    ]
  }
};

