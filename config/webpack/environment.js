const { environment } = require('@rails/webpacker')

// jQueryを管理下として認定
const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)
//// jQueryを管理下として認定


module.exports = environment
