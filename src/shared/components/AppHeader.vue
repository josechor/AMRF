<template>
  <header class="app-header">
    <nav>
      <div class="logo">
        <router-link to="/" class="logo-link">
          <h2>SEHC x ANCHOA</h2>
        </router-link>
      </div>

      <!-- Botón hamburguesa -->
      <button
        class="menu-toggle"
        @click="toggleMenu"
        :class="{ active: isMenuOpen }"
      >
        <span></span>
        <span></span>
        <span></span>
      </button>

      <!-- Overlay para cerrar el menú -->
      <div
        class="menu-overlay"
        :class="{ visible: isMenuOpen }"
        @click="closeMenu"
      ></div>

      <!-- Menú de navegación -->
      <ul class="nav-links" :class="{ open: isMenuOpen }">
        <li>
          <router-link to="/" @click="closeMenu">Home</router-link>
        </li>
        <li>
          <router-link to="/timeline" @click="closeMenu">Timeline</router-link>
        </li>
        <li>
          <router-link to="/map" @click="closeMenu">Mapa</router-link>
        </li>
        <li>
          <router-link to="/weekly-quiz" @click="closeMenu"
            >Quiz Semanal</router-link
          >
        </li>
        <li>
          <router-link to="/future-plans" @click="closeMenu"
            >Planes Futuros</router-link
          >
        </li>
      </ul>
    </nav>
  </header>
</template>

<script setup>
import { ref } from "vue";

const isMenuOpen = ref(false);

const toggleMenu = () => {
  isMenuOpen.value = !isMenuOpen.value;
};

const closeMenu = () => {
  isMenuOpen.value = false;
};
</script>

<style scoped>
.app-header {
  background: var(--gradient-romantic);
  padding: 1rem 2rem;
  box-shadow: 0 4px 12px var(--shadow-soft);
  width: 100%;
  flex-shrink: 0;
  position: relative;
  z-index: 1000;
}

nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  margin: 0 auto;
}

.logo h2 {
  color: var(--text-title);
  margin: 0;
  font-weight: 700;
  text-shadow: 0 2px 4px rgba(226, 226, 226, 0.5);
  font-size: 1.5rem;
  letter-spacing: 1px;
  z-index: 1001;
}

.logo-link {
  text-decoration: none;
  cursor: pointer;
  transition: opacity 0.3s ease;
}

.logo-link:hover {
  opacity: 0.8;
}

/* Botón hamburguesa */
.menu-toggle {
  display: none;
  flex-direction: column;
  gap: 5px;
  background: none;
  border: none;
  cursor: pointer;
  padding: 0.5rem;
  z-index: 1001;
  position: relative;
}

.menu-toggle span {
  width: 28px;
  height: 3px;
  background-color: var(--text-title);
  border-radius: 3px;
  transition: all 0.3s ease;
}

.menu-toggle.active span:nth-child(1) {
  transform: rotate(45deg) translate(8px, 8px);
}

.menu-toggle.active span:nth-child(2) {
  opacity: 0;
}

.menu-toggle.active span:nth-child(3) {
  transform: rotate(-45deg) translate(7px, -7px);
}

/* Navegación */
.nav-links {
  display: flex;
  list-style: none;
  gap: 1rem;
  margin: 0;
  padding: 0;
  z-index: 1001;
}

.nav-links a {
  color: var(--text-primary);
  text-decoration: none;
  font-weight: 600;
  transition: all 0.3s ease;
  padding: 0.6rem 1.2rem;
  border-radius: 25px;
  background-color: rgba(255, 255, 255, 0.5);
  backdrop-filter: blur(5px);
}

.nav-links a:hover {
  background-color: rgba(255, 255, 255, 0.8);
  transform: translateY(-2px);
  box-shadow: 0 4px 12px var(--shadow-soft);
}

.nav-links a.router-link-active {
  background-color: var(--bg-card);
  color: var(--accent-love);
  box-shadow: 0 4px 12px var(--shadow-medium);
  font-weight: 700;
}

.menu-overlay {
  display: none;
}

/* Responsive - Móvil */
@media (max-width: 768px) {
  .app-header {
    padding: 1rem 1.5rem;
  }

  .logo h2 {
    font-size: 1.2rem;
  }

  .menu-toggle {
    display: flex;
  }

  .nav-links {
    position: fixed;
    top: 0;
    right: -100%;
    height: 100vh;
    width: 280px;
    flex-direction: column;
    background: var(--gradient-romantic);
    padding: 6rem 2rem 2rem;
    gap: 0.5rem;
    transition: right 0.4s ease-in-out;
    box-shadow: -4px 0 20px rgba(0, 0, 0, 0.1);
    overflow-y: auto;
  }

  .nav-links.open {
    right: 0;
  }

  .nav-links li {
    width: 100%;
  }

  .nav-links a {
    display: block;
    width: 100%;
    text-align: center;
    padding: 1rem;
    font-size: 1.1rem;
  }

  .nav-links a:hover {
    transform: translateX(-5px);
  }

  .menu-overlay {
    display: block;
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0, 0, 0, 0.5);
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.3s ease;
    z-index: 999;
  }

  .menu-overlay.visible {
    opacity: 1;
    pointer-events: auto;

  }
}

/* Tablets */
@media (max-width: 1024px) and (min-width: 769px) {
  .logo h2 {
    font-size: 1.3rem;
  }

  .nav-links {
    gap: 0.5rem;
  }

  .nav-links a {
    padding: 0.5rem 0.8rem;
    font-size: 0.9rem;
  }
}
</style>
