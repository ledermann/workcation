<template>
  <main class="px-8 py-6 lg:px-0 lg:py-20 lg:relative lg:min-h-screen">
    <div class="lg:mx-auto xl:max-w-6xl">
      <div class="lg:pl-12 lg:pr-8 lg:w-7/12">
        <img alt="Logo" :src="imagePath('logo-white.svg')" class="h-10 w-auto">

        <p class="mt-3 text-xs" v-if="git.commit_url">
          <a
            :href="git.commit_url"
            class="hover:underline"
          >
            {{ git.commit_sha }}
          </a>
          <span class="ml-1 text-gray-700">
            {{ commitTimeRelative }}
          </span>
        </p>

        <div class="relative mt-6 lg:mt-0 lg:absolute lg:inset-y-0 lg:right-0 lg:w-5/12">
          <img
            :srcset="imagePath('beach-work-small.jpg') + ' 1024w, ' + imagePath('beach-work-large.jpg') + ' 3008w'"
            sizes="100vw"
            :src="imagePath('beach-work-small.jpg')"
            class="h-56 w-full object-cover object-center rounded-lg shadow-xl lg:inset-0 lg:h-full lg:object-left lg:shadow-none lg:rounded-none"
            alt="People workcationing on beach"
          >

          <div class="absolute left-0 top-0 flex flex-col justify-center bottom-0 w-40 opacity-75 bg-white text-gray-900 px-3 py-2 text-sm rounded-l shadow-md
                      lg:fixed lg:w-auto lg:max-w-md lg:mt-6 lg:left-auto lg:bottom-auto lg:right-0">
            <p>
              Example on how to use
              <a class="font-bold hover:underline" href="https://inertiajs.com/">
                Inertia.js
              </a>
              to build the frontend with
              <a class="font-bold hover:underline" href="https://vuejs.org/">
                Vue.js
              </a>
              within a
              <a class="font-bold hover:underline" href="https://rubyonrails.org/">
                Ruby on Rails
              </a>
              application
            </p>

            <p class="mt-3">Styles made with
              <a class="font-bold hover:underline" href="https://tailwindcss.com/">
                Tailwind CSS
              </a>
            </p>
          </div>

          <svg
            class="hidden absolute inset-y-0 left-0 w-16 h-full lg:block"
            fill="none"
            preserveAspectRatio="none"
            viewBox="0 0 100 100"
            xmlns="http://www.w3.org/2000/svg"
          >
            <polygon
              fill="currentColor"
              class="text-gray-100"
              points="0,0 0,100 100,0"
            />
          </svg>
        </div>

        <h1 class="mt-8 text-3xl font-bold text-gray-900 leading-tight sm:text-4xl lg:mt-12">
          You can work from anywhere.
          <br class="hidden sm:inline">
          <span class="text-indigo-500">
            Take advantage of it.
          </span>
        </h1>

        <p class="mt-4 text-gray-700 text-xl">
          Workcation helps you find work-friendly rentals in beautiful locations
          so you can enjoy some nice weather even when you’re not on vacation.
        </p>

        <div class="mt-8 -mx-1 flex flex-wrap">
          <inertia-link
            href="/properties"
            class="m-1 px-4 py-3 bg-indigo-600 rounded-lg text-white font-semibold tracking-wide uppercase shadow-lg hover:bg-indigo-400"
          >
            Book your escape
          </inertia-link>

          <inertia-link
            href="/properties/new"
            class="m-1 px-4 py-3 bg-black rounded-lg text-white font-semibold tracking-wide uppercase shadow-lg hover:bg-gray-700"
          >
            List your property
          </inertia-link>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
import Layout from '@/shared/Layout.vue'
import { format } from 'timeago.js'

export default {
  metaInfo: { title: 'Welcome' },
  layout: Layout,
  props: {
    git: Object
  },
  computed: {
    commitTimeRelative() {
      return format(this.git.commit_time)
    }
  }
}
</script>
