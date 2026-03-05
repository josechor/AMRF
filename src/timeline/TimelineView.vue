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

          <!-- Parents + connector + child in a 2-column grid.
               SVG uses viewBox "0 0 100 60" with x=25 and x=75
               so lines always hit column centers (25% / 75%). -->
          <div class="tree-grid">
            <div class="person-card">
              <div class="photo-ring">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="12" cy="8" r="4.5"/>
                  <path d="M3 21c0-4.5 4-8 9-8s9 3.5 9 8"/>
                </svg>
              </div>
              <p class="person-name">El Patriarca</p>
              <p class="person-label">Ramón</p>
            </div>
            <div class="person-card">
              <div class="photo-ring">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="12" cy="8" r="4.5"/>
                  <path d="M3 21c0-4.5 4-8 9-8s9 3.5 9 8"/>
                </svg>
              </div>
              <p class="person-name">La Matriarca</p>
              <p class="person-label">Estela</p>
            </div>

            <!-- 2 parents → 1 child -->
            <svg class="tree-svg" viewBox="0 0 100 60" preserveAspectRatio="none">
              <line x1="25" y1="0" x2="75" y2="0" class="tree-line"/>
              <line x1="50" y1="0" x2="50" y2="60" class="tree-line"/>
            </svg>

            <div class="person-card person-card--solo card-featured">
              <div class="photo-ring photo-ring--featured">
                <img src="../shared/assets/Images/Familia/YoGanster.png" alt="José" />
              </div>
              <p class="person-name">Don</p>
              <p class="person-label">José</p>
            </div>
          </div>

        </div>

        <!-- ── VERTICAL DIVIDER ── -->
        <div class="trees-divider"></div>

        <!-- ── RIGHT TREE: Ella ── -->
        <div class="tree-panel">

          <div class="tree-label">Su lado</div>

          <div class="tree-grid">
            <div class="person-card">
              <div class="photo-ring">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="12" cy="8" r="4.5"/>
                  <path d="M3 21c0-4.5 4-8 9-8s9 3.5 9 8"/>
                </svg>
              </div>
              <p class="person-name">Il Vecchio</p>
              <p class="person-label">Ignacio</p>
            </div>
            <div class="person-card">
              <div class="photo-ring">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="12" cy="8" r="4.5"/>
                  <path d="M3 21c0-4.5 4-8 9-8s9 3.5 9 8"/>
                </svg>
              </div>
              <p class="person-name">La Matriarca</p>
              <p class="person-label">Marina</p>
            </div>

            <!-- 2 parents → 2 children (forked) -->
            <svg class="tree-svg" viewBox="0 0 100 60" preserveAspectRatio="none">
              <line x1="25" y1="0" x2="75" y2="0" class="tree-line"/>
              <line x1="50" y1="0" x2="50" y2="30" class="tree-line"/>
              <line x1="25" y1="30" x2="75" y2="30" class="tree-line"/>
              <line x1="25" y1="30" x2="25" y2="60" class="tree-line"/>
              <line x1="75" y1="30" x2="75" y2="60" class="tree-line"/>
            </svg>

            <div class="person-card card-featured">
              <div class="photo-ring photo-ring--featured">
                <img src="../shared/assets/Images/Familia/AinoaGanster.png" alt="Ainoa" />
              </div>
              <p class="person-name">Donna</p>
              <p class="person-label">Ainoa</p>
            </div>
            <div class="person-card">
              <div class="photo-ring">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="12" cy="8" r="4.5"/>
                  <path d="M3 21c0-4.5 4-8 9-8s9 3.5 9 8"/>
                </svg>
              </div>
              <p class="person-name">La Sorella</p>
              <p class="person-label">Noemi</p>
            </div>
          </div>

        </div>

      </div>

    </div>
  </div>
</template>

<script setup>
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

/* ─── Tree grid ────────────────────────────────────────────── */
/* 2-column grid with no gap so parent centers sit at exactly
   25% and 75% of total width — matching the SVG viewBox coords. */
.tree-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  column-gap: 0;
  row-gap: 0;
  justify-items: center;
  width: 100%;
}

/* ─── Person card ──────────────────────────────────────────── */
.person-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.8rem;
  padding: 0 0.5rem 1.4rem;
}

/* Single child spanning both columns */
.person-card--solo {
  grid-column: 1 / -1;
  padding-bottom: 0;
}

.person-name {
  font-size: var(--text-lg);
  font-weight: 600;
  color: var(--text-primary);
  margin: 0;
  letter-spacing: 0.03em;
}

.person-label {
  font-size: var(--text-sm);
  color: var(--text-secondary);
  letter-spacing: 0.07em;
  text-transform: uppercase;
  margin: 0;
}

/* ─── Photo rings ──────────────────────────────────────────── */
.photo-ring {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  background: var(--bg-card);
  border: 2px solid oklch(0.65 0.10 85 / 0.45);
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--text-muted);
  flex-shrink: 0;
  overflow: hidden;
}

.photo-ring svg {
  width: 56px;
  height: 56px;
}

.photo-ring img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center top;
  display: block;
}

.photo-ring--featured {
  width: 188px;
  height: 188px;
  border-color: var(--accent-gold);
  box-shadow: 0 0 0 5px oklch(0.65 0.10 85 / 0.1);
  color: var(--text-secondary);
}

.photo-ring--featured svg {
  width: 70px;
  height: 70px;
}

.card-featured .person-name {
  color: var(--accent-gold);
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

  .photo-ring {
    width: 130px;
    height: 130px;
  }

  .photo-ring svg {
    width: 48px;
    height: 48px;
  }

  .photo-ring--featured {
    width: 162px;
    height: 162px;
  }

  .photo-ring--featured svg {
    width: 60px;
    height: 60px;
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

  .photo-ring {
    width: 110px;
    height: 110px;
  }

  .photo-ring svg {
    width: 42px;
    height: 42px;
  }

  .photo-ring--featured {
    width: 136px;
    height: 136px;
  }

  .photo-ring--featured svg {
    width: 52px;
    height: 52px;
  }

  .person-name {
    font-size: var(--text-base);
  }

  .person-label {
    font-size: var(--text-xs);
  }

  .tree-svg {
    height: 56px;
  }
}

@media (max-width: 480px) {
  .photo-ring {
    width: 88px;
    height: 88px;
  }

  .photo-ring svg {
    width: 34px;
    height: 34px;
  }

  .photo-ring--featured {
    width: 110px;
    height: 110px;
  }

  .photo-ring--featured svg {
    width: 42px;
    height: 42px;
  }

  .person-card {
    padding: 0 0.2rem 0.8rem;
  }

  .tree-svg {
    height: 46px;
  }
}
</style>
