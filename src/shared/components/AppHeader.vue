<template>
  <header class="app-header">
    <nav>
      <!-- Logo -->
      <router-link to="/" class="logo-link">
        <span class="logo-icon">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="12" cy="12" r="10"/>
            <circle cx="12" cy="12" r="3"/>
            <line x1="12" y1="2" x2="12" y2="5"/>
            <line x1="12" y1="19" x2="12" y2="22"/>
            <line x1="2" y1="12" x2="5" y2="12"/>
            <line x1="19" y1="12" x2="22" y2="12"/>
          </svg>
        </span>
        <span class="logo-text">LA ORGANIZACIÓN</span>
      </router-link>

      <!-- Botón hamburguesa (móvil) -->
      <button
        class="menu-toggle"
        @click="toggleMenu"
        :class="{ active: isMenuOpen }"
        aria-label="Abrir menú"
      >
        <span></span>
        <span></span>
        <span></span>
      </button>

      <!-- Overlay -->
      <div
        class="menu-overlay"
        :class="{ visible: isMenuOpen }"
        @click="closeMenu"
      ></div>

      <!-- Navegación -->
      <ul class="nav-links" :class="{ open: isMenuOpen }">
        <li>
          <router-link to="/" @click="closeMenu" exact-active-class="active-link">
            El Negocio
          </router-link>
        </li>
        <li>
          <router-link to="/map" @click="closeMenu" active-class="active-link">
            El Territorio
          </router-link>
        </li>
        <li>
          <router-link to="/timeline" @click="closeMenu" active-class="active-link">
            La Familia
          </router-link>
        </li>
        <li>
          <router-link to="/future-plans" @click="closeMenu" active-class="active-link">
            Los Planes
          </router-link>
        </li>
      </ul>
    </nav>
  </header>
</template>

<script setup>
import { ref } from "vue";

const isMenuOpen = ref(false);
const toggleMenu = () => { isMenuOpen.value = !isMenuOpen.value; };
const closeMenu = () => { isMenuOpen.value = false; };
</script>

<style scoped>
.app-header {
  background: #0f0f0f;
  border-bottom: 1px solid var(--border-subtle);
  padding: 0 2rem;
  height: 56px;
  width: 100%;
  flex-shrink: 0;
  position: relative;
  z-index: 1000;
}

nav {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 100%;
  max-width: 1400px;
  margin: 0 auto;
  gap: 1rem;
}

/* Logo */
.logo-link {
  display: flex;
  align-items: center;
  gap: 0.55rem;
  text-decoration: none;
  color: var(--accent-gold);
  letter-spacing: 0.12em;
  font-weight: 700;
  font-size: 0.95rem;
  white-space: nowrap;
  transition: opacity 0.2s;
}

.logo-link:hover {
  opacity: 0.8;
}

.logo-icon {
  color: var(--accent-gold);
  display: flex;
  align-items: center;
}

.logo-text {
  font-family: 'Bebas Neue', 'Rajdhani', sans-serif;
  font-size: 1.2rem;
  letter-spacing: 0.15em;
}

/* Nav links */
.nav-links {
  display: flex;
  list-style: none;
  gap: 0.25rem;
  margin: 0;
  padding: 0;
}

.nav-links a {
  color: var(--text-secondary);
  text-decoration: none;
  font-weight: 500;
  font-size: 0.9rem;
  letter-spacing: 0.04em;
  padding: 0.4rem 1rem;
  border-radius: 4px;
  border: 1px solid transparent;
  transition: color 0.2s, border-color 0.2s;
  white-space: nowrap;
}

.nav-links a:hover {
  color: var(--text-primary);
}

.nav-links a.active-link,
.nav-links a.router-link-exact-active {
  color: var(--accent-gold);
  border-color: var(--accent-gold);
  background: transparent;
  box-shadow: 0 0 0 1px var(--accent-gold), 0 2px 10px var(--shadow-gold-active);
}

/* Hamburguesa */
.menu-toggle {
  display: none;
  flex-direction: column;
  gap: 5px;
  background: none;
  border: none;
  cursor: pointer;
  padding: 0.5rem;
  z-index: 1001;
}

.menu-toggle span {
  width: 24px;
  height: 2px;
  background-color: var(--text-primary);
  border-radius: 2px;
  transition: all 0.3s ease;
}

.menu-toggle.active span:nth-child(1) { transform: rotate(45deg) translate(7px, 7px); }
.menu-toggle.active span:nth-child(2) { opacity: 0; }
.menu-toggle.active span:nth-child(3) { transform: rotate(-45deg) translate(6px, -6px); }

.menu-overlay { display: none; }

/* Responsive */
@media (max-width: 768px) {
  .app-header { padding: 0 1rem; }

  .menu-toggle { display: flex; }

  .nav-links {
    position: fixed;
    top: 0;
    right: -100%;
    height: 100vh;
    width: 260px;
    flex-direction: column;
    background: #0f0f0f;
    border-left: 1px solid var(--border-subtle);
    padding: 5rem 1.5rem 2rem;
    gap: 0.25rem;
    transition: right 0.35s ease-in-out;
    overflow-y: auto;
  }

  .nav-links.open { right: 0; }

  .nav-links li { width: 100%; }

  .nav-links a {
    display: block;
    width: 100%;
    padding: 0.75rem 1rem;
    font-size: 1rem;
  }

  .menu-overlay {
    display: block;
    position: fixed;
    inset: 0;
    background-color: rgba(0, 0, 0, 0.7);
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
</style>
