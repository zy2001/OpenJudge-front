module.exports = {
  productionSourceMap: false,
  configureWebpack: {
    externals: {
      vue: 'Vue',
      vuex: 'Vuex',
      'element-ui': 'ELEMENT'
    },
    resolve: {
      alias: {
        'assets': '@/assets',
        'common': '@/assets/common',
        'content': '@/assets/content',
        'components': '@/components',
        'network': '@/network',
        'views': '@/views',
        'network': '@/network'
      }
    }
  }
}