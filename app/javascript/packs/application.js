// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import '../styles/application.scss'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "controllers"

// Vue
import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue'
import SiteHeader from '@/components/SiteHeader'
import SearchFilters from '@/components/SearchFilters'
import PropertyCard from '@/components/PropertyCard'

Vue.use(TurbolinksAdapter)
Vue.component('search-filters', SearchFilters)
Vue.component('site-header', SiteHeader)
Vue.component('property-card', PropertyCard)

document.addEventListener('turbolinks:load', () => {
  for (const element of document.querySelectorAll('[data-behavior="vue"]')) {
    const app = new Vue({
      el: element
    })
  }
});
