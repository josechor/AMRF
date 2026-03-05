<template>
  <div class="familia">
    <div class="page-body">

      <header class="page-header">
        <h1 class="page-title">La Familia</h1>
        <p class="page-subtitle">Las raíces que nos unen</p>
      </header>

      <!-- ─────────────────── FAMILY TREES ─────────────────── -->
      <div class="trees-wrapper">

        <!-- ── LEFT TREE: José ── -->
        <div class="tree-panel">

          <div class="tree-label">Mi lado</div>

          <div class="tree-grid">
            <PersonCard apodo="El Patriarca" nombre="Ramón" />
            <PersonCard apodo="La Matriarca" nombre="Estela" />

            <!-- 2 parents → 1 child -->
            <svg class="tree-svg" viewBox="0 0 100 60" preserveAspectRatio="none">
              <line x1="25" y1="0" x2="75" y2="0" class="tree-line"/>
              <line x1="50" y1="0" x2="50" y2="60" class="tree-line"/>
            </svg>

            <PersonCard
              class="card-solo"
              apodo="Don"
              nombre="José"
              imagen="YoGanster.png"
              :featured="true"
            />
          </div>

        </div>

        <!-- ── VERTICAL DIVIDER ── -->
        <div class="trees-divider"></div>

        <!-- ── RIGHT TREE: Ainoa ── -->
        <div class="tree-panel">

          <div class="tree-label">Su lado</div>

          <div class="tree-grid">
            <PersonCard apodo="Il Vecchio" nombre="Ignacio" />
            <PersonCard apodo="La Matriarca" nombre="Marina" />

            <!-- 2 parents → 2 children (forked) -->
            <svg class="tree-svg" viewBox="0 0 100 60" preserveAspectRatio="none">
              <line x1="25" y1="0" x2="75" y2="0" class="tree-line"/>
              <line x1="50" y1="0" x2="50" y2="30" class="tree-line"/>
              <line x1="25" y1="30" x2="75" y2="30" class="tree-line"/>
              <line x1="25" y1="30" x2="25" y2="60" class="tree-line"/>
              <line x1="75" y1="30" x2="75" y2="60" class="tree-line"/>
            </svg>

            <PersonCard
              apodo="Donna"
              nombre="Ainoa"
              imagen="AinoaGanster.png"
              :featured="true"
            />
            <PersonCard apodo="La Sorella" nombre="Noemi" />
          </div>

        </div>

      </div>

    </div>
  </div>
</template>

<script setup>
import PersonCard from './components/PersonCard.vue'
</script>

<style scoped>
/* ─── Layout ─────────────────────────────────────────────── */
.familia {
  min-height: calc(100vh - 86px);
  background: var(--bg-primary);
}

.page-body {
  max-width: 1400px;
  margin: 0 auto;
  padding: 2.5rem 3rem 4rem;
}

/* ─── Page header ─────────────────────────────────────────── */
.page-header {
  text-align: center;
  margin-bottom: 3.5rem;
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

/* ─── Trees wrapper ────────────────────────────────────────── */
.trees-wrapper {
  display: grid;
  grid-template-columns: 1fr 1px 1fr;
  align-items: start;
}

.trees-divider {
  background: var(--accent-gold);
  opacity: 0.2;
  align-self: stretch;
  margin: 0.5rem 0;
}

/* ─── Each tree panel ──────────────────────────────────────── */
.tree-panel {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0 3rem;
}

.tree-label {
  font-size: var(--text-xs);
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--accent-gold);
  margin-bottom: 2rem;
  border: 1px solid var(--accent-gold);
  padding: 0.3rem 1rem;
  border-radius: 2px;
  opacity: 0.7;
}

/* ─── Tree grid ─────────────────────────────────────────────── */
/* No column-gap so column centers land at 25%/75%,
   matching the SVG viewBox coordinates exactly. */
.tree-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  column-gap: 0;
  row-gap: 0;
  justify-items: center;
  width: 100%;
}

/* Solo child spans both columns and centers itself */
.card-solo {
  grid-column: 1 / -1;
  padding-bottom: 0;
}

/* ─── SVG tree connector ───────────────────────────────────── */
.tree-svg {
  grid-column: 1 / -1;
  width: 100%;
  height: 70px;
}

.tree-line {
  stroke: var(--accent-gold);
  stroke-width: 1.8;
  stroke-linecap: round;
  opacity: 0.55;
}

/* ─── Responsive ─────────────────────────────────────────────  */
@media (max-width: 1024px) {
  .tree-panel {
    padding: 0 1.5rem;
  }
}

@media (max-width: 768px) {
  .page-body {
    padding: 1.5rem 1rem 3rem;
  }

  .trees-wrapper {
    grid-template-columns: 1fr;
    row-gap: 3rem;
  }

  .trees-divider {
    display: none;
  }

  .tree-panel {
    padding: 0 0.5rem;
  }

  .tree-svg {
    height: 56px;
  }
}

@media (max-width: 480px) {
  .tree-svg {
    height: 46px;
  }
}
</style>
