<template>
  <div class="home">
    <h1>Home</h1>
    <p>Bienvenido a AMRF</p>
    <div class="color-palette">
      <div class="color-box" style="background: var(--primary-rose)">Rosa</div>
      <div class="color-box" style="background: var(--primary-blush)">Durazno</div>
      <div class="color-box" style="background: var(--primary-lavender)">Lavanda</div>
      <div class="color-box" style="background: var(--primary-mint)">Menta</div>
      <div class="color-box" style="background: var(--primary-peach)">Melocotón</div>
    </div>
  </div>
</template>

<script setup>
</script>

<style scoped>
.home {
  padding: 3rem;
  max-width: 1200px;
  margin: 0 auto;
}

h1 {
  color: var(--accent-deep-rose);
  margin-bottom: 1rem;
  font-size: 3em;
}

p {
  color: var(--text-secondary);
  font-size: 1.2em;
  margin-bottom: 2rem;
}

.color-palette {
  display: flex;
  gap: 1rem;
  flex-wrap: wrap;
  margin-top: 2rem;
}

.color-box {
  padding: 2rem;
  border-radius: 15px;
  min-width: 150px;
  text-align: center;
  font-weight: 600;
  color: var(--text-primary);
  box-shadow: 0 4px 12px var(--shadow-soft);
  transition: transform 0.3s ease;
}

.color-box:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 16px var(--shadow-medium);
}
</style>
