const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

const path = require('path')
environment.config.merge({
  resolve: {
    alias: {
      '@': path.resolve('app/javascript'),
      vue$: 'vue/dist/vue.esm.js',
    }
  }
})

environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
  Rails: ['@rails/ujs']
}))

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
module.exports = environment
