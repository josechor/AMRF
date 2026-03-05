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

      <!-- ─── Mapa Leaflet ───────────────────────── -->
      <div ref="mapArea" class="map-area">
        <div ref="mapContainer" class="leaflet-map"></div>
      </div>

      <!-- ─── Territory Cards ────────────────────── -->
      <div class="territories-grid">
        <div class="territory-card" v-for="t in territories" :key="t.id" @click="focusTerritory(t)">
          <div class="card-top">
            <span class="t-code">ZONA {{ String(t.id).padStart(2, '0') }}</span>
            <span class="t-status-badge">◆ CONQUISTADO</span>
          </div>

          <h2 class="t-name">{{ t.name }}</h2>
          <a class="t-location" :href="t.mapUrl" target="_blank" rel="noopener noreferrer" @click.stop>
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
import { ref, computed, onMounted, onUnmounted } from 'vue'
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

const territories = [
  {
    id: 1,
    name: 'El Koi',
    location: 'Vigo',
    operations: 1,
    coords: [42.06547424493406, -8.504045586508964],
    mapUrl: 'https://www.google.com/maps/place//data=!4m2!3m1!1s0xd259d698791e63f:0xeb55356da6f44b0b?sa=X&ved=1t:8290&ictx=111',
  },
  {
    id: 2,
    name: 'Umi · Laxe',
    location: 'A Laxe, Vigo',
    operations: 3,
    coords: [42.240739199931284, -8.72681290000497],
    mapUrl: 'https://www.google.com/maps/place//data=!4m2!3m1!1s0xd2f63f6591ac4a1:0xd325ec4ebc5c5487?sa=X&ved=1t:8290&ictx=111',
  },
  {
    id: 3,
    name: 'Umi · Samil',
    location: 'Samil, Vigo',
    operations: 1,
    coords: [42.20755352005486, -8.775723742327358],
    mapUrl: 'https://www.google.com/maps/place//data=!4m2!3m1!1s0xd258bccd5c79eb1:0xa553d04668cdf310?sa=X&ved=1t:8290&ictx=111',
  },
]

const totalOps      = computed(() => territories.reduce((s, t) => s + t.operations, 0))
const maxOps        = computed(() => Math.max(...territories.map(t => t.operations)))
const bestTerritory = computed(() => territories.reduce((a, b) => a.operations >= b.operations ? a : b))

// ── Leaflet ────────────────────────────────────────
const mapArea      = ref(null)
const mapContainer = ref(null)
let map     = null
const markers = {}

const goldIcon = L.divIcon({
  className: '',
  html: `<div class="lf-pin"><div class="lf-pin-pulse"></div></div>`,
  iconSize: [16, 16],
  iconAnchor: [8, 8],
  popupAnchor: [0, -12],
})

onMounted(() => {
  map = L.map(mapContainer.value, {
    center: [42.177408533898905, -8.508628879944949],
    zoom: 10,
    zoomControl: false,
    attributionControl: false,
  })

  L.tileLayer('https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png', {
    subdomains: 'abcd',
    maxZoom: 19,
  }).addTo(map)

  L.control.zoom({ position: 'bottomright' }).addTo(map)

  territories.forEach(t => {
    const ops = t.operations === 1 ? '1 operación' : `${t.operations} operaciones`
    const popup = `
      <div class="lf-popup">
        <div class="lf-popup-code">ZONA ${String(t.id).padStart(2, '0')}</div>
        <div class="lf-popup-name">${t.name}</div>
        <div class="lf-popup-ops">${ops}</div>
        <a href="${t.mapUrl}" target="_blank" rel="noopener noreferrer" class="lf-popup-link">
          Ver en Maps →
        </a>
      </div>
    `
    markers[t.id] = L.marker(t.coords, { icon: goldIcon })
      .addTo(map)
      .bindPopup(popup, { className: 'lf-popup-wrapper', maxWidth: 200 })
  })
})

function focusTerritory(t) {
  mapArea.value.scrollIntoView({ behavior: 'smooth', block: 'start' })
  setTimeout(() => {
    map.flyTo(t.coords, 16, { duration: 0.8 })
    setTimeout(() => markers[t.id].openPopup(), 900)
  }, 400)
}

onUnmounted(() => {
  if (map) {
    map.remove()
    map = null
  }
})
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
.page-header { text-align: center; }

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
  color: #c9a84c;
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
  height: 400px;
  border: 1px solid var(--border-subtle);
  border-radius: 8px;
  overflow: hidden;
}

.leaflet-map {
  width: 100%;
  height: 100%;
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
  cursor: pointer;
}

.territory-card:hover {
  border-color: #c9a84c;
  box-shadow: 0 0 0 1px #c9a84c, 0 4px 20px rgba(201, 168, 76, 0.2);
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
  color: #c9a84c;
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

.t-location:hover { color: #c9a84c; }
.t-location:hover svg { opacity: 1; }

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
  background: #c9a84c;
  border-color: #c9a84c;
  box-shadow: 0 0 4px rgba(201, 168, 76, 0.5);
}

/* ─── Responsive ──────────────────────────────── */
@media (max-width: 1024px) {
  .territories-grid { grid-template-columns: repeat(2, 1fr); }
}

@media (max-width: 768px) {
  .page-body { padding: 1.5rem 1rem 3rem; }
  .territory-stats { gap: 1.5rem; padding: 1rem 1.2rem; }
  .map-area { height: 300px; }
  .territories-grid { grid-template-columns: 1fr; }
}

@media (max-width: 480px) {
  .territory-stats { flex-direction: column; gap: 1rem; }
  .t-stat-divider { width: 40px; height: 1px; }
}
</style>

<!-- Estilos globales para Leaflet (no scoped) -->
<style>
/* ── Marcador dorado ── */
.lf-pin {
  width: 16px;
  height: 16px;
  background: #c9a84c;
  border-radius: 50%;
  border: 2px solid #111;
  box-shadow: 0 0 10px rgba(201, 168, 76, 0.7);
  position: relative;
}

.lf-pin-pulse {
  position: absolute;
  inset: -4px;
  border-radius: 50%;
  background: rgba(201, 168, 76, 0.3);
  animation: lf-pulse 2s ease-out infinite;
}

@keyframes lf-pulse {
  0%   { transform: scale(1);   opacity: 0.5; }
  100% { transform: scale(2.2); opacity: 0; }
}

/* ── Popup wrapper (override Leaflet) ── */
.lf-popup-wrapper .leaflet-popup-content-wrapper {
  background: #1c1c1c;
  border: 1px solid #2a2a2a;
  border-radius: 6px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.6);
  padding: 0;
}

.lf-popup-wrapper .leaflet-popup-content {
  margin: 0;
}

.lf-popup-wrapper .leaflet-popup-tip-container {
  display: none;
}

.lf-popup-wrapper .leaflet-popup-close-button {
  color: #555;
  font-size: 16px;
  top: 6px;
  right: 8px;
}

.lf-popup-wrapper .leaflet-popup-close-button:hover {
  color: #c9a84c;
}

/* ── Contenido del popup ── */
.lf-popup {
  padding: 14px 16px;
  font-family: 'Inter', 'Rajdhani', sans-serif;
  min-width: 160px;
}

.lf-popup-code {
  font-size: 11px;
  letter-spacing: 0.14em;
  color: #555;
  text-transform: uppercase;
  margin-bottom: 4px;
}

.lf-popup-name {
  font-family: 'Bebas Neue', 'Rajdhani', sans-serif;
  font-size: 22px;
  letter-spacing: 0.08em;
  color: #ffffff;
  line-height: 1;
  margin-bottom: 6px;
}

.lf-popup-ops {
  font-size: 13px;
  color: #888;
  margin-bottom: 10px;
}

.lf-popup-link {
  display: inline-block;
  font-size: 12px;
  letter-spacing: 0.06em;
  color: #c9a84c;
  text-decoration: none;
  border: 1px solid rgba(201, 168, 76, 0.3);
  padding: 4px 10px;
  border-radius: 3px;
  transition: background 0.2s, border-color 0.2s;
}

.lf-popup-link:hover {
  background: rgba(201, 168, 76, 0.1);
  border-color: #c9a84c;
}

/* ── Zoom control ── */
.leaflet-control-zoom {
  border: 1px solid #2a2a2a !important;
  border-radius: 6px !important;
  overflow: hidden;
}

.leaflet-control-zoom a {
  background: #1c1c1c !important;
  color: #888 !important;
  border-bottom: 1px solid #2a2a2a !important;
  width: 30px !important;
  height: 30px !important;
  line-height: 30px !important;
}

.leaflet-control-zoom a:hover {
  background: #242424 !important;
  color: #c9a84c !important;
}
</style>
