<template>
  <div class="territory">
    <div class="page-body">

      <!-- ─── Header ─────────────────────────────── -->
      <header class="page-header">
        <h1 class="page-title">El Territorio</h1>
        <p class="page-subtitle">Zonas bajo control de la organización</p>
      </header>

      <!-- ─── Stats bar ──────────────────────────── -->
      <div class="territory-stats">
        <div class="t-stat">
          <span class="t-stat-value">{{ territories.length }}</span>
          <span class="t-stat-label">Territorios conquistados</span>
        </div>
        <div class="t-stat-divider"></div>
        <div class="t-stat">
          <span class="t-stat-value">{{ totalOps }}</span>
          <span class="t-stat-label">Operaciones totales</span>
        </div>
        <div class="t-stat-divider"></div>
        <div class="t-stat">
          <span class="t-stat-value">{{ bestTerritory.operations }}</span>
          <span class="t-stat-label">Máx. ops · {{ bestTerritory.name }}</span>
        </div>
      </div>

      <!-- ─── Map placeholder ────────────────────── -->
      <div class="map-area">
        <div class="map-grid-bg"></div>
        <div class="map-pins">
          <div
            v-for="(t, i) in territories"
            :key="t.id"
            class="map-pin"
            :style="pinPositions[i]"
          >
            <div class="pin-dot"></div>
            <div class="pin-pulse"></div>
            <span class="pin-label">{{ t.name }}</span>
          </div>
        </div>
        <div class="map-badge">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
            <polygon points="3 6 9 3 15 6 21 3 21 18 15 21 9 18 3 21"/>
            <line x1="9" y1="3" x2="9" y2="18"/>
            <line x1="15" y1="6" x2="15" y2="21"/>
          </svg>
          Mapa interactivo · Próximamente
        </div>
      </div>

      <!-- ─── Territory Cards ────────────────────── -->
      <div class="territories-grid">
        <div class="territory-card" v-for="t in territories" :key="t.id">
          <div class="card-top">
            <span class="t-code">ZONA {{ String(t.id).padStart(2, '0') }}</span>
            <span class="t-status-badge">◆ CONQUISTADO</span>
          </div>

          <h2 class="t-name">{{ t.name }}</h2>
          <a class="t-location" :href="t.mapUrl" target="_blank" rel="noopener noreferrer">
            <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/>
              <circle cx="12" cy="10" r="3"/>
            </svg>
            {{ t.location }}
          </a>

          <div class="t-divider"></div>

          <div class="t-ops-row">
            <div class="t-ops-info">
              <span class="t-ops-value">{{ t.operations }}</span>
              <span class="t-ops-label">operaciones</span>
            </div>
            <div class="t-ops-dots">
              <span
                v-for="n in maxOps"
                :key="n"
                class="ops-dot"
                :class="{ filled: n <= t.operations }"
              ></span>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'

const territories = [
  { id: 1, name: 'El Koi',      location: 'Vigo',         operations: 1, mapUrl: 'https://www.google.com/maps/place//data=!4m2!3m1!1s0xd259d698791e63f:0xeb55356da6f44b0b?sa=X&ved=1t:8290&ictx=111' },
  { id: 2, name: 'Umi · Laxe',  location: 'A Laxe, Vigo', operations: 2, mapUrl: 'https://www.google.com/maps/place//data=!4m2!3m1!1s0xd2f63f6591ac4a1:0xd325ec4ebc5c5487?sa=X&ved=1t:8290&ictx=111' },
  { id: 3, name: 'Umi · Samil', location: 'Samil, Vigo',  operations: 1, mapUrl: 'https://www.google.com/maps/place//data=!4m2!3m1!1s0xd258bccd5c79eb1:0xa553d04668cdf310?sa=X&ved=1t:8290&ictx=111' },
]

const pinPositions = [
  { top: '38%', left: '28%' },
  { top: '55%', left: '52%' },
  { top: '30%', left: '68%' },
]

const totalOps     = computed(() => territories.reduce((s, t) => s + t.operations, 0))
const maxOps       = computed(() => Math.max(...territories.map(t => t.operations)))
const bestTerritory = computed(() => territories.reduce((a, b) => a.operations >= b.operations ? a : b))
</script>

<style scoped>
.territory {
  min-height: calc(100vh - 86px);
  background: var(--bg-primary);
}

.page-body {
  max-width: 1400px;
  margin: 0 auto;
  padding: 2.5rem 3rem 4rem;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/* ─── Header ───────────────────────────────────── */
.page-header {
  text-align: center;
}

.page-title {
  font-family: 'Bebas Neue', 'Rajdhani', sans-serif;
  font-size: clamp(2.6rem, 5vw, 4rem);
  letter-spacing: 0.12em;
  color: var(--text-title);
  margin: 0 0 0.3rem;
}

.page-subtitle {
  font-size: var(--text-sm);
  color: var(--text-secondary);
  letter-spacing: 0.08em;
  text-transform: uppercase;
  margin: 0;
}

/* ─── Stats bar ───────────────────────────────── */
.territory-stats {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 2.5rem;
  background: var(--bg-card);
  border: 1px solid var(--border-subtle);
  border-radius: 8px;
  padding: 1.25rem 2rem;
}

.t-stat {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.2rem;
}

.t-stat-value {
  font-family: 'Bebas Neue', 'Rajdhani', sans-serif;
  font-size: var(--text-xl);
  color: var(--accent-gold);
  line-height: 1;
  letter-spacing: 0.05em;
}

.t-stat-label {
  font-size: var(--text-xs);
  color: var(--text-secondary);
  letter-spacing: 0.08em;
  text-transform: uppercase;
  white-space: nowrap;
}

.t-stat-divider {
  width: 1px;
  height: 36px;
  background: var(--border-subtle);
}

/* ─── Map area ────────────────────────────────── */
.map-area {
  position: relative;
  height: 280px;
  background: var(--bg-card);
  border: 1px solid var(--border-subtle);
  border-radius: 8px;
  overflow: hidden;
}

.map-grid-bg {
  position: absolute;
  inset: 0;
  background-image:
    linear-gradient(var(--border-subtle) 1px, transparent 1px),
    linear-gradient(90deg, var(--border-subtle) 1px, transparent 1px);
  background-size: 40px 40px;
  opacity: 0.5;
}

.map-grid-bg::after {
  content: '';
  position: absolute;
  inset: 0;
  background: radial-gradient(ellipse at center, transparent 40%, var(--bg-card) 100%);
}

/* ── Pins ── */
.map-pins {
  position: absolute;
  inset: 0;
}

.map-pin {
  position: absolute;
  transform: translate(-50%, -50%);
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 6px;
  cursor: default;
}

.pin-dot {
  width: 10px;
  height: 10px;
  background: var(--accent-gold);
  border-radius: 50%;
  box-shadow: 0 0 8px var(--shadow-gold-active);
  position: relative;
  z-index: 2;
}

.pin-pulse {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: var(--accent-gold);
  opacity: 0.4;
  animation: pulse 2s ease-out infinite;
}

@keyframes pulse {
  0%   { transform: translate(-50%, -50%) scale(1);   opacity: 0.4; }
  100% { transform: translate(-50%, -50%) scale(3.5); opacity: 0; }
}

.pin-label {
  font-size: var(--text-xs);
  color: var(--accent-gold);
  letter-spacing: 0.06em;
  background: rgba(15, 15, 15, 0.85);
  padding: 2px 7px;
  border-radius: 3px;
  border: 1px solid rgba(255, 255, 255, 0.06);
  white-space: nowrap;
  position: relative;
  z-index: 2;
}

.map-badge {
  position: absolute;
  bottom: 12px;
  right: 14px;
  display: flex;
  align-items: center;
  gap: 6px;
  font-size: var(--text-xs);
  color: var(--text-muted);
  letter-spacing: 0.06em;
}

/* ─── Territory cards ─────────────────────────── */
.territories-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1rem;
}

.territory-card {
  background: var(--bg-card);
  border: 1px solid var(--border-subtle);
  border-radius: 8px;
  padding: 1.4rem 1.5rem 1.2rem;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  transition: border-color 0.25s, box-shadow 0.25s;
}

.territory-card:hover {
  border-color: var(--accent-gold);
  box-shadow: 0 0 0 1px var(--accent-gold), 0 4px 20px var(--shadow-gold);
}

.card-top {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.t-code {
  font-size: var(--text-xs);
  letter-spacing: 0.14em;
  color: var(--text-muted);
  text-transform: uppercase;
}

.t-status-badge {
  font-size: var(--text-xs);
  letter-spacing: 0.1em;
  color: var(--accent-gold);
  text-transform: uppercase;
}

.t-name {
  font-family: 'Bebas Neue', 'Rajdhani', sans-serif;
  font-size: var(--text-xl);
  letter-spacing: 0.08em;
  color: var(--text-title);
  margin: 0;
  line-height: 1.1;
}

.t-location {
  display: flex;
  align-items: center;
  gap: 5px;
  font-size: var(--text-sm);
  color: var(--text-secondary);
  text-decoration: none;
  transition: color 0.2s;
}

.t-location svg {
  flex-shrink: 0;
  opacity: 0.6;
  transition: opacity 0.2s;
}

.t-location:hover {
  color: var(--accent-gold);
}

.t-location:hover svg {
  opacity: 1;
}

.t-divider {
  height: 1px;
  background: var(--border-subtle);
  margin: 0.25rem 0;
}

.t-ops-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: auto;
}

.t-ops-info {
  display: flex;
  align-items: baseline;
  gap: 0.4rem;
}

.t-ops-value {
  font-family: 'Bebas Neue', 'Rajdhani', sans-serif;
  font-size: var(--text-display);
  color: var(--text-title);
  line-height: 1;
  letter-spacing: 0.02em;
}

.t-ops-label {
  font-size: var(--text-xs);
  color: var(--text-secondary);
  letter-spacing: 0.08em;
  text-transform: uppercase;
}

.t-ops-dots {
  display: flex;
  gap: 5px;
  flex-wrap: wrap;
  justify-content: flex-end;
  max-width: 120px;
}

.ops-dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  border: 1px solid var(--border-subtle);
  background: transparent;
}

.ops-dot.filled {
  background: var(--accent-gold);
  border-color: var(--accent-gold);
  box-shadow: 0 0 4px var(--shadow-gold);
}

/* ─── Responsive ──────────────────────────────── */
@media (max-width: 1024px) {
  .territories-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 768px) {
  .page-body {
    padding: 1.5rem 1rem 3rem;
  }

  .territory-stats {
    gap: 1.5rem;
    padding: 1rem 1.2rem;
  }

  .map-area {
    height: 220px;
  }

  .territories-grid {
    grid-template-columns: 1fr;
  }
}

@media (max-width: 480px) {
  .territory-stats {
    flex-direction: column;
    gap: 1rem;
  }

  .t-stat-divider {
    width: 40px;
    height: 1px;
  }
}
</style>
