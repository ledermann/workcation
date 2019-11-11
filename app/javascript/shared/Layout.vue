<template>
  <div class="min-h-screen bg-gray-100 antialiased xl:flex xl:flex-col xl:h-screen">
    <slot />
  </div>
</template>

<script>
export default {
  props: {
    title: String
  },
  watch: {
    title: {
      immediate: true,
      handler(title) {
        document.title = title
      }
    }
  }
}
</script>
