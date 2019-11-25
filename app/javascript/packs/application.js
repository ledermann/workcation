// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()

import '../styles/application.scss'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

const req = require.context('../components', true, /\.(js|vue)$/i)
req.keys().map((key) => {
  const name = key.match(/\w+/)[0]
  return Vue.component(name, req(key).default)
})

import VueMeta from 'vue-meta'
Vue.use(VueMeta)

import MatomoTracker from '@/utils/matomo-tracker'
const matomo = new MatomoTracker()

// Matomo integration is tricky, because Inertia doesn't have hooks yet
if (matomo.enabled) {
  Vue.mixin({
    mounted() {
      if (this._vueMeta === true) {
        // A Vue component with vueMeta seems to be a Page, so track the visit -
        // but wait a bit to allow VueMeta to update the document.title
        setTimeout(() => {
          matomo.trackPageView()
        }, 100)
      }
    }
  })
}

import axios from 'axios'
axios.defaults.xsrfCookieName = "CSRF-TOKEN";
axios.defaults.xsrfHeaderName = "X-CSRF-Token";

import {
  InertiaApp
} from '@inertiajs/inertia-vue'
import Vue from 'vue'

Vue.use(InertiaApp)

const app = document.getElementById('app')

new Vue({
  metaInfo: {
    title: 'Loading…',
    titleTemplate: '%s | Workcation',
  },
  render: h => h(InertiaApp, {
    props: {
      initialPage: JSON.parse(app.dataset.page),
      resolveComponent: name => import(`../pages/${name}`).then(module => module.default),
    },
  }),
}).$mount(app)
