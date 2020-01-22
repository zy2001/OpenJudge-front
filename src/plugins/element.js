import Vue from 'vue'
import { Button, Form, FormItem, Input, Message } from 'element-ui'
import { Container, Header, Main, Footer } from 'element-ui'
import { Menu, MenuItem, Submenu } from 'element-ui'
import { Table, TableColumn,  Progress } from 'element-ui'
import { Pagination } from 'element-ui'

Vue.use(Pagination)

Vue.use(Table)
Vue.use(TableColumn)
Vue.use(Progress)

Vue.use(Menu)
Vue.use(MenuItem)
Vue.use(Submenu)
Vue.use(Container)
Vue.use(Header)
Vue.use(Main)
Vue.use(Footer)

Vue.use(Button)
Vue.use(Form)
Vue.use(FormItem)
Vue.use(Input)
Vue.prototype.$message = Message