module.exports = {
  configureWebpack: {
    resolve: {
      alias: {
        'assets': '@/assets',
        'common': '@/assets/common',
        'content': '@/assets/content',
        'components': '@/components',
        'network': '@/network',
        'views': '@/views',
      }
    }
  }
}