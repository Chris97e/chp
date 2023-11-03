const path = require("path");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const StylelintPlugin = require('stylelint-webpack-plugin');
const ESLintPlugin = require('eslint-webpack-plugin');


module.exports = {
  mode: "development",
  entry: "./src/ts/app.ts",
  output: {
    path: path.resolve(__dirname, "../chp/static/"),
    clean: true,
    filename: "js/index.js",
  },
  module: {
    rules: [
      {
        test: /\.(sa|sc|c)ss$/,
        use: [
          MiniCssExtractPlugin.loader,
          "css-loader",
          "postcss-loader",
          "sass-loader",
        ],
      },
      {
        test: /\.tsx?$/,
        use: 'ts-loader',
        exclude: /node_modules/,
      },
      {
        test: /\.(woff|woff2|eot|ttf|otf)$/i,
        type: 'asset/resource',
        generator: {
          filename: "assets/fonts/[name][ext]",
          
        },
      },
      {
        test: /\.(svg)$/i,
        type: 'asset/resource',
        generator: {
          filename: "assets/svg/[name][ext]",
          
        },
      },
    ],
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: "css/main.css",
    }),
    new StylelintPlugin({
      files: './src/scss/**/*.scss',
    }),
    new ESLintPlugin({
      files: './src/ts/**/*.ts',
    }),
  ],
};
