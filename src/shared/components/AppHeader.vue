<template>
  <header class="app-header">
    <nav>
      <div class="logo">
        <h2>AMRF</h2>
      </div>
      <ul class="nav-links">
        <li>
          <router-link to="/">Home</router-link>
        </li>
        <li>
          <router-link to="/timeline">Timeline</router-link>
        </li>
        <li>
          <router-link to="/map">Mapa</router-link>
        </li>
        <li>
          <router-link to="/weekly-quiz">Quiz Semanal</router-link>
        </li>
        <li>
          <router-link to="/future-plans">Planes Futuros</router-link>
        </li>
      </ul>
    </nav>
  </header>
</template>

<script setup>
</script>

<style scoped>
.app-header {
  background-color: #2c3e50;
  padding: 1rem 2rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  width: 100%;
  flex-shrink: 0;
}

nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  margin: 0 auto;
}

.logo h2 {
  color: #42b983;
  margin: 0;
}

.nav-links {
  display: flex;
  list-style: none;
  gap: 2rem;
  margin: 0;
  padding: 0;
}

.nav-links a {
  color: white;
  text-decoration: none;
  font-weight: 500;
  transition: color 0.3s;
}

.nav-links a:hover,
.nav-links a.router-link-active {
  color: #42b983;
}
</style>
