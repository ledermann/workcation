<template>
  <header class="bg-gray-900 sm:flex sm:items-center sm:justify-between xl:bg-white">
    <div class="flex justify-between px-4 py-3 xl:w-72 xl:bg-gray-900 xl:justify-center xl:py-5">
      <inertia-link href="/">
        <img class="h-8 w-auto" src="@/images/logo-black.svg" alt="Logo"/>
      </inertia-link>
      <div class="flex sm:hidden">
        <button @click="toggle" type="button" class="px-2 text-gray-500 hover:text-white focus:outline-none focus:text-white" aria-label="Toggle nav">
          <svg class="h-6 w-6 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path v-if="isOpen" fill-rule="evenodd" clip-rule="evenodd" d="M18.278 16.864a1 1 0 0 1-1.414 1.414l-4.829-4.828-4.828 4.828a1 1 0 0 1-1.414-1.414l4.828-4.829-4.828-4.828a1 1 0 0 1 1.414-1.414l4.829 4.828 4.828-4.828a1 1 0 1 1 1.414 1.414l-4.828 4.829 4.828 4.828z"/>
            <path v-if="!isOpen" fill-rule="evenodd" d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"/>
          </svg>
        </button>
      </div>
    </div>
    <nav class="sm:flex sm:items-center sm:px-4 xl:flex-1 xl:justify-between" :class="{ 'hidden': !isOpen, 'block': isOpen }">
      <div class="hidden xl:block xl:relative xl:max-w-xs xl:w-full">
        <div class="absolute inset-y-0 left-0 flex items-center pl-3">
          <svg class="h-6 w-6 fill-current text-gray-600" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M16.32 14.9l1.1 1.1c.4-.02.83.13 1.14.44l3 3a1.5 1.5 0 0 1-2.12 2.12l-3-3a1.5 1.5 0 0 1-.44-1.14l-1.1-1.1a8 8 0 1 1 1.41-1.41l.01-.01zM10 16a6 6 0 1 0 0-12 6 6 0 0 0 0 12z"/></svg>
        </div>
        <form @submit.prevent="submitSearch">
          <input
            type="search"
            class="block w-full form-input form-input-light pl-10 pr-4 py-2"
            placeholder="Search by keywords"
            name="search"
            v-model="searchKeywords"
            id="header-search"
          >
        </form>
      </div>
      <div class="sm:flex sm:items-center">
        <div class="px-2 pt-2 pb-5 border-b border-gray-800 sm:flex sm:border-b-0 sm:py-0 sm:px-0">
          <template v-for="(link, index) in primaryLinks">
            <a :key="index"
               :href="link.url"
               :class="{ 'mt-1': index > 0 }"
               class="block px-3 py-1 rounded font-semibold text-white hover:bg-gray-800 sm:mt-0 sm:text-sm sm:px-2 sm:ml-2 xl:text-gray-900 xl:hover:bg-gray-200">
              {{ link.name }}
            </a>
          </template>
        </div>
        <div class="relative px-5 py-5 sm:py-0 sm:ml-4 sm:px-0">
          <div class="flex items-center sm:hidden">
            <img class="h-10 w-10 object-cover rounded-full border-2 border-gray-600" :src="userImage" alt="">
            <span class="ml-4 font-semibold text-gray-200 sm:hidden">{{ userName }}</span>
          </div>
          <div class="mt-5 sm:hidden">
            <template v-for="(link, index) in accountLinks">
              <a :key="index"
                 :href="link.url"
                 class="mt-3 block text-gray-400 hover:text-white">
                {{ link.name }}
              </a>
            </template>
          </div>
          <Dropdown class="hidden sm:block">
            <template #trigger="{ hasFocus, isOpen }">
              <span class="block h-8 w-8 overflow-hidden rounded-full border-2 "
                :class="[(hasFocus || isOpen) ? 'border-white xl:border-indigo-500' : 'border-gray-600 xl:border-gray-300']"
              >
                <img class="h-full w-full object-cover" src="https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=256&q=80" alt="">
              </span>
            </template>
            <template #dropdown>
              <div class="mt-3 bg-white xl:border rounded-lg w-48 py-2 shadow-xl">
                <a v-for="(link, index) in accountLinks"
                    :key="index"
                    :href="link.url"
                    class="block hover:text-white text-gray-800 px-4 py-2 hover:bg-indigo-500"
                    :class="index > 0 ? 'mt-0' : ''"
                >
                  {{ link.name }}
                </a>
              </div>
            </template>
          </Dropdown>
        </div>
      </div>
    </nav>
  </header>
</template>

<script>
import Dropdown from '@/components/Dropdown'
import 'core-js/features/url-search-params'

export default {
  components: { Dropdown },

  props: ['userName', 'userImage', 'primaryLinks', 'accountLinks'],

  data() {
    return {
      isOpen: false,
      searchKeywords: new URL(window.location).searchParams.get('keywords')
    }
  },

  methods: {
    toggle() {
      this.isOpen = !this.isOpen
    },

    submitSearch() {
      let searchParams = Object.fromEntries(
        new URL(window.location).searchParams
      )
      searchParams.keywords = this.searchKeywords

      this.$inertia.visit('/properties', {
        preserveState: true,
        data: searchParams
      })
    }
  }
}
</script>
