<template>
  <div class="future-plans">
    <div class="empty-state">
      <div class="empty-icon">◈</div>
      <h1 class="empty-title">Planes Futuros</h1>
      <div class="empty-divider"></div>
      <p class="empty-message">Aún sin planes</p>
      <p class="empty-sub">Esta sección se completará próximamente</p>
    </div>
  </div>
</template>

<script setup>
</script>

<style scoped>
.future-plans {
  min-height: calc(100vh - 86px);
  background: var(--bg-primary);
  display: flex;
  align-items: center;
  justify-content: center;
}

.empty-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.75rem;
  text-align: center;
  padding: 3rem;
}

.empty-icon {
  font-size: 2.5rem;
  color: var(--accent-gold);
  opacity: 0.35;
  line-height: 1;
  margin-bottom: 0.5rem;
}

.empty-title {
  font-family: "Bebas Neue", "Rajdhani", sans-serif;
  font-size: clamp(2.6rem, 5vw, 4rem);
  letter-spacing: 0.12em;
  color: var(--text-title);
  margin: 0;
}

.empty-divider {
  width: 60px;
  height: 1px;
  background: var(--accent-gold);
  opacity: 0.3;
  margin: 0.5rem 0;
}

.empty-message {
  font-size: var(--text-sm);
  color: var(--text-secondary);
  letter-spacing: 0.08em;
  text-transform: uppercase;
  margin: 0;
  opacity: 0.7;
}

.empty-sub {
  font-size: var(--text-xs);
  color: var(--text-secondary);
  letter-spacing: 0.06em;
  margin: 0;
  opacity: 0.4;
}
</style>
