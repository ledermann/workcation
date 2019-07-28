<template>
  <div class="min-h-screen bg-gray-200 antialiased xl:flex xl:flex-col xl:h-screen">
    <site-header
      :search-text="searchText"
      :primary-links="primaryLinks"
      :account-links="accountLinks"
      user-name="Isla Schoger"
      user-image="https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=256&q=80"
    ></site-header>

    <main>
      <slot />
    </main>
  </div>
</template>

<script>
export default {
  props: [
    'searchText',
    'primaryLinks',
    'accountLinks'
  ]
}
</script>
