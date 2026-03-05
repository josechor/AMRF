<script setup>
import AppHeader from './shared/components/AppHeader.vue'
</script>

<template>
  <div id="app">
    <AppHeader />
    <main>
      <router-view />
    </main>
    <footer class="app-footer">
      <span>La Organización © 2026 – Todos los derechos reservados</span>
    </footer>
  </div>
</template>

<style>
#app {
  display: flex;
  flex-direction: column;
  width: 100vw;
  min-height: 100vh;
  font-family: 'Inter', 'Rajdhani', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: var(--text-primary);
  background: var(--bg-primary);
  overflow: hidden;
  
}

main {
  flex: 1;
  width: 100%;
  overflow-y: auto;
  overflow-x: hidden;
  background: var(--bg-primary);
}

.app-footer {
  flex-shrink: 0;
  width: 100%;
  border-top: 1px solid var(--border-subtle);
  background: #0f0f0f;
  padding: 30px 2rem;
  text-align: center;
  font-size: var(--text-xs);
  letter-spacing: 0.08em;
  color: var(--text-muted);
}
</style>
