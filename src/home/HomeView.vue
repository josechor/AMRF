<template>
  <div class="home">
    <div class="dashboard-body">

      <!-- ── HERO ── -->
      <section class="hero">
        <div class="hero-overlay"></div>
        <div class="hero-content">
          <h1 class="hero-title">
            BIENVENIDO AL <span class="gold">IMPERIO</span>
          </h1>
          <p class="hero-subtitle">Donde los negocios se hacen con clase y poder</p>
        </div>
      </section>

      <!-- ── STATS ── -->
      <section class="stats-grid">
        <div class="stat-card">
          <div class="stat-header">
            <span class="stat-label">DÍAS ACTIVOS</span>
            <span class="stat-icon">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="3"/><line x1="12" y1="2" x2="12" y2="5"/><line x1="12" y1="19" x2="12" y2="22"/><line x1="2" y1="12" x2="5" y2="12"/><line x1="19" y1="12" x2="22" y2="12"/></svg>
            </span>
          </div>
          <div class="stat-value">{{ daysTogether }}</div>
          <div class="stat-bar"></div>
        </div>

        <div class="stat-card">
          <div class="stat-header">
            <span class="stat-label">OPERACIONES</span>
            <span class="stat-icon">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="6"/><circle cx="12" cy="12" r="2"/></svg>
            </span>
          </div>
          <div class="stat-value">{{ stats.operaciones }}</div>
          <div class="stat-bar"></div>
        </div>

        <div class="stat-card">
          <div class="stat-header">
            <span class="stat-label">TERRITORIOS</span>
            <span class="stat-icon">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><polygon points="3 6 9 3 15 6 21 3 21 18 15 21 9 18 3 21"/><line x1="9" y1="3" x2="9" y2="18"/><line x1="15" y1="6" x2="15" y2="21"/></svg>
            </span>
          </div>
          <div class="stat-value">{{ stats.territorios }}</div>
          <div class="stat-bar"></div>
        </div>

        <div class="stat-card">
          <div class="stat-header">
            <span class="stat-label">LA FAMILIA</span>
            <span class="stat-icon">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
            </span>
          </div>
          <div class="stat-value">{{ stats.familia }}</div>
          <div class="stat-bar"></div>
        </div>
      </section>

      <!-- ── NAV CARDS ── -->
      <section class="nav-grid">
        <router-link to="/" class="nav-card active-card">
          <span class="nav-card-icon">
            <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="3"/><line x1="12" y1="2" x2="12" y2="5"/><line x1="12" y1="19" x2="12" y2="22"/><line x1="2" y1="12" x2="5" y2="12"/><line x1="19" y1="12" x2="22" y2="12"/></svg>
          </span>
          <div class="nav-card-text">
            <span class="nav-card-title">EL NEGOCIO</span>
            <span class="nav-card-sub">Dashboard principal</span>
          </div>
        </router-link>

        <router-link to="/map" class="nav-card">
          <span class="nav-card-icon">
            <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><polygon points="3 6 9 3 15 6 21 3 21 18 15 21 9 18 3 21"/><line x1="9" y1="3" x2="9" y2="18"/><line x1="15" y1="6" x2="15" y2="21"/></svg>
          </span>
          <div class="nav-card-text">
            <span class="nav-card-title">EL TERRITORIO</span>
            <span class="nav-card-sub">Mapa de operaciones</span>
          </div>
        </router-link>

        <router-link to="/timeline" class="nav-card">
          <span class="nav-card-icon">
            <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
          </span>
          <div class="nav-card-text">
            <span class="nav-card-title">LA FAMILIA</span>
            <span class="nav-card-sub">Los miembros</span>
          </div>
        </router-link>

        <router-link to="/future-plans" class="nav-card">
          <span class="nav-card-icon">
            <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="6"/><circle cx="12" cy="12" r="2"/></svg>
          </span>
          <div class="nav-card-text">
            <span class="nav-card-title">LOS PLANES</span>
            <span class="nav-card-sub">Próximos movimientos</span>
          </div>
        </router-link>
      </section>

      <!-- ── QUOTE ── -->
      <section class="quote-card">
        <p class="quote-text">
          "En este negocio, la lealtad lo es todo. El respeto se gana, no se regala."
        </p>
        <span class="quote-author">— EL DON</span>
      </section>

    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

// Fecha de inicio
const startDate = new Date('2025-11-12')

const daysTogether = computed(() => {
  const today = new Date()
  return Math.floor(Math.abs(today - startDate) / (1000 * 60 * 60 * 24))
})

const stats = ref({
  operaciones: 4,
  territorios: 3,
  familia: 7,
})
</script>

<style scoped>
.home {
  min-height: calc(100vh - 56px);
  background: var(--bg-primary);
}

/* ── Hero ── */
.hero {
  position: relative;
  width: 100%;
  height: 400px;
  background-color: #1a1a1a;
  overflow: hidden;
  border-radius: 8px;
  border: 1px solid var(--accent-gold);
}

.hero::before {
  content: '';
  position: absolute;
  inset: -12px;          /* extra space so edges don't show during movement */
  background-image: url('../shared/assets/Images/Gansters.webp');
  background-size: cover;
  background-position: 50% 40%;
  animation: hero-drift 10s infinite;
  will-change: transform;
}

@keyframes hero-drift {
  0%   { transform: translate(0px,   0px);  }
  25%  { transform: translate(2px,  -5px);  }
  50%  { transform: translate(-4px, -3px);  }
  75%  { transform: translate(-1px,  4px);  }
  100% { transform: translate(0px,   0px);  }
}

.hero-overlay {
  position: absolute;
  inset: 0;
  background: var(--gradient-hero);
  z-index: 1;
}

.hero-content {
  position: relative;
  z-index: 2;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  height: 100%;
  padding: 0 2.5rem 2rem;
  max-width: 1400px;
  margin: 0 auto;
}

.hero-title {
  font-family: 'Bebas Neue', 'Rajdhani', sans-serif;
  font-size: clamp(2rem, 5vw, 3.2rem);
  font-weight: 400;
  letter-spacing: 0.05em;
  color: #ffffff;
  line-height: 1.1;
  margin: 0 0 0.4rem;
  text-shadow: 0 2px 12px rgba(0,0,0,0.6);
}

.hero-title .gold {
  color: var(--accent-gold);
}

.hero-subtitle {
  font-size: var(--text-base);
  color: rgba(255, 255, 255, 0.8);
  margin: 0;
  font-weight: 400;
  letter-spacing: 0.02em;
}

/* ── Dashboard body ── */
.dashboard-body {
  max-width: 1400px;
  margin: 0 auto;
  padding: 2rem 2.5rem 3rem;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/* ── Stats ── */
.stats-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 1rem;
}

.stat-card {
  background: var(--bg-card);
  border: 1px solid var(--accent-gold);
  border-radius: 8px;
  padding: 1.2rem 1.4rem 1rem;
  transition: box-shadow 0.25s;
}

.stat-card:hover {
  box-shadow: 0 0 0 1px var(--accent-gold), 0 4px 16px var(--shadow-gold);
}

.stat-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 0.75rem;
}

.stat-label {
  font-size: var(--text-base);
  letter-spacing: 0.12em;
  color: var(--text-secondary);
  font-weight: 600;
}

.stat-icon {
  color: var(--accent-gold);
  display: flex;
}

.stat-value {
  font-family: 'Bebas Neue', 'Rajdhani', sans-serif;
  font-size: var(--text-display);
  color: var(--text-title);
  line-height: 1;
  margin-bottom: 0.8rem;
  letter-spacing: 0.02em;
}

.stat-bar {
  height: 2px;
  background: var(--accent-gold);
  border-radius: 1px;
  width: 100%;
}

/* ── Nav Cards ── */
.nav-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 1rem;
}

.nav-card {
  display: flex;
  align-items: center;
  gap: 1.2rem;
  background: var(--bg-card);
  border: 1px solid var(--accent-gold);
  border-radius: 8px;
  padding: 1.4rem 1.6rem;
  text-decoration: none;
  transition: background 0.25s, box-shadow 0.25s;
  cursor: pointer;
}

.nav-card:hover {
  background: var(--bg-card-hover);
  box-shadow: 0 0 0 1px var(--accent-gold), 0 4px 16px var(--shadow-gold);
}

.nav-card.active-card {
  background: oklch(0.75 0.13 85 / 0.07);
  box-shadow: 0 0 0 2px var(--accent-gold), 0 6px 28px var(--shadow-gold-active);
}

.nav-card-icon {
  color: var(--text-secondary);
  flex-shrink: 0;
  display: flex;
  transition: color 0.2s;
}

.nav-card:hover .nav-card-icon,
.active-card .nav-card-icon {
  color: var(--accent-gold);
}

.nav-card-text {
  display: flex;
  flex-direction: column;
  gap: 0.2rem;
}

.nav-card-title {
  font-family: 'Bebas Neue', 'Rajdhani', sans-serif;
  font-size: var(--text-xl);
  letter-spacing: 0.1em;
  color: var(--text-title);
  font-weight: 600;
}

.nav-card-sub {
  font-size: var(--text-base);
  color: var(--text-secondary);
  font-weight: 400;
}

/* ── Quote ── */
.quote-card {
  border: 1px solid var(--accent-gold);
  border-radius: 8px;
  padding: 1.8rem 2rem;
  text-align: center;
  background: transparent;
  max-width: 700px;
  margin: 0 auto;
}

.quote-text {
  font-style: italic;
  color: var(--text-secondary);
  font-size: var(--text-base);
  line-height: 1.7;
  margin: 0 0 0.75rem;
}

.quote-author {
  font-size: var(--text-sm);
  letter-spacing: 0.15em;
  color: var(--accent-gold);
  font-weight: 600;
}

/* ── Responsive ── */
@media (max-width: 1024px) {
  .stats-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 768px) {
  .hero {
    height: 300px;
  }

  .hero-content {
    padding: 0 1.5rem 1.5rem;
  }

  .dashboard-body {
    padding: 1.5rem 1.5rem 2.5rem;
    gap: 1.5rem;
  }

  .stats-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 0.75rem;
  }

  .nav-grid {
    grid-template-columns: 1fr;
    gap: 0.75rem;
  }

  .stat-value {
    font-size: var(--text-xl);
  }
}

@media (max-width: 480px) {
  .hero {
    height: 280px;
  }

  .dashboard-body {
    padding: 1rem 1rem 2rem;
  }

  .stats-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 0.6rem;
  }

  .stat-card {
    padding: 1rem;
  }

  .stat-value {
    font-size: var(--text-lg);
  }
}
</style>
