<script setup>
import AppHeader from './shared/components/AppHeader.vue'
</script>

<template>
  <div id="app">
    <AppHeader />
    <main>
      <router-view />
    </main>
  </div>
</template>

<style>
#app {
  display: flex;
  flex-direction: column;
  width: 100vw;
  height: 100vh;
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  overflow: hidden;
}

main {
  flex: 1;
  width: 100%;
  height: 100%;
  overflow-y: auto;
  overflow-x: hidden;
}
</style>
