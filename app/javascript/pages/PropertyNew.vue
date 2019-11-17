<template>
  <div class="min-h-screen bg-gray-200 antialiased xl:flex xl:flex-col xl:h-screen">
    <site-header
      :primary-links="primaryLinks"
      :account-links="accountLinks"
      user-name="Jane Doe"
      user-image="https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=256&q=80"
      class="xl:flex-shrink-0"
    />

    <div class="xl:flex-1 xl:flex xl:overflow-y-hidden">
      <div class="bg-gray-800 xl:w-72">
      </div>

      <main class="py-6">
        <div class="px-4 xl:px-8">
          <h1 class="mb-8 font-bold text-3xl">
            <inertia-link class="text-indigo-500 hover:text-indigo-900" href="/properties">Properties</inertia-link>
            <span class="text-indigo-500 font-medium">/</span> Add yours
          </h1>

          <div class="bg-white rounded shadow overflow-hidden max-w-lg">
            <form @submit.prevent="submit">
              <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
                <text-input v-model="form.title" :errors="$page.errors.title" class="pr-6 w-full" label="Title" />
              </div>
              <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
                <text-input v-model="form.beds" :errors="$page.errors.beds" class="pr-6 w-full lg:w-1/2" label="Beds" type="number" min="0" />
                <text-input v-model="form.baths" :errors="$page.errors.baths" class="pr-6 w-full lg:w-1/2" label="Baths" type="number" min="0" />
              </div>

              <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
                <select-input v-model="form.location_id" :errors="$page.errors.location" class="pr-6 w-full lg:w-1/2" label="Location">
                  <option :value="null" />
                  <option v-for="location in locations" :key="location.id" :value="location.id">{{ location.title }}</option>
                </select-input>

                <text-input v-model="form.price" :errors="$page.errors.price" class="pr-6 w-full lg:w-1/2" label="Price /wk" />
              </div>

              <div class="mt-5 px-8 py-4 bg-grey-100 border-t border-grey-200 flex justify-end items-center">
                <loading-button :loading="sending" class="btn-indigo" type="submit">
                  Create Property
                </loading-button>
              </div>
            </form>
          </div>
        </div>
      </main>
    </div>
  </div>
</template>

<script>
import Layout from '@/shared/Layout.vue'

export default {
  metaInfo: { title: 'New property' },

  layout: Layout,

  props: {
    primaryLinks: Array,
    accountLinks: Array,
    locations: Array
  },

  data() {
    return {
      sending: false,
      form: {
        title: null,
        beds: null,
        baths: null,
        price: null,
        location_id: null
      }
    }
  },

  methods: {
    submit() {
      this.sending = true
      this.$inertia
        .post('/properties', this.form)
        .then(() => (this.sending = false))
    }
  }
}
</script>
