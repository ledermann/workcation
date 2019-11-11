<template>
  <div>
    <site-header
      :primary-links="primaryLinks"
      :account-links="accountLinks"
      user-name="Jane Doe"
      user-image="https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=256&q=80"
    />

    <div class="xl:flex-1 xl:flex xl:overflow-y-hidden">
      <search-filters />

      <main v-if="properties.length > 0" class="py-6 xl:flex-1 xl:overflow-x-hidden">
        <div :class="i > 0 ? 'mt-6' : ''" v-for="(properties, locationId, i) in byLocation" v-bind:key="locationId">
          <div class="px-4 xl:px-8">
            <h3 class="text-gray-900 text-xl">{{ properties[0].location.title }}</h3>
            <p class="text-gray-700">{{ properties[0].location.description }}</p>
          </div>
          <div class="mt-6 sm:overflow-x-auto sm:overflow-y-hidden">
            <div class="px-4 sm:inline-flex sm:pt-2 sm:pb-8 xl:px-8">
              <div v-for="(property,j) in properties"
                   v-bind:key="property.id"
                   class="sm:mt-0 sm:w-80 sm:flex-shrink-0"
                   :class="j > 0 ? 'mt-10 sm:ml-4' : ''"
              >
                <property-card :property="property" />
              </div>
            </div>
          </div>
        </div>
      </main>
      <main v-else class="py-6">
        <div class="px-4 xl:px-8">
          <h3 class="text-gray-900 text-xl">No property found</h3>
          <p class="text-gray-700">Please change your filters!</p>
        </div>
      </main>
    </div>
  </div>
</template>

<script>
import Layout from '@/shared/Layout.vue'
import { groupBy } from 'lodash'

export default {
  metaInfo: { title: 'Properties' },
  layout: Layout,
  props: {
    properties: Array,
    primaryLinks: Array,
    accountLinks: Array
  },
  computed: {
    byLocation() {
      return groupBy(this.properties, function(property) {
        return property.location.id
      })
    }
  }
}
</script>
