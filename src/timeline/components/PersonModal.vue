<template>
  <Teleport to="body">
    <Transition name="modal">
      <div v-if="person" class="overlay" @click.self="$emit('close')">
        <div class="modal" role="dialog" :aria-label="person.nombre">

          <button class="close-btn" @click="$emit('close')" aria-label="Cerrar">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round">
              <line x1="18" y1="6" x2="6" y2="18"/>
              <line x1="6" y1="6" x2="18" y2="18"/>
            </svg>
          </button>

          <!-- Left: photo (sticky) -->
          <div class="modal-photo">
            <img v-if="person.imagen" :src="person.imagen" :alt="person.nombre" />
            <div v-else class="photo-placeholder">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="8" r="4.5"/>
                <path d="M3 21c0-4.5 4-8 9-8s9 3.5 9 8"/>
              </svg>
            </div>
          </div>

          <!-- Right: scrollable info -->
          <div class="modal-info">

            <!-- Identity header -->
            <div class="modal-identity">
              <p class="modal-apodo">{{ person.apodo }}</p>
              <h2 class="modal-nombre">{{ person.nombre }}</h2>
            </div>

            <!-- 📝 Descripción -->
            <div class="section">
              <p class="section-header">📝 Descripción</p>
              <p class="section-body">{{ person.descripcion }}</p>
            </div>

            <!-- 🎯 Especialidad -->
            <div class="section">
              <p class="section-header">🎯 Especialidad</p>
              <p class="section-body">{{ person.especialidad }}</p>
            </div>

            <!-- 👍 Gustos -->
            <div class="section">
              <p class="section-header">👍 Gustos</p>
              <ul class="section-list">
                <li v-for="item in person.gustos" :key="item">{{ item }}</li>
              </ul>
            </div>

            <!-- 🧠 Habilidades -->
            <div class="section">
              <p class="section-header">🧠 Habilidades</p>
              <ul class="section-list">
                <li v-for="item in person.habilidades" :key="item">{{ item }}</li>
              </ul>
            </div>

            <!-- ⚡ Debilidades -->
            <div class="section">
              <p class="section-header">⚡ Debilidades</p>
              <ul class="section-list">
                <li v-for="item in person.debilidades" :key="item">{{ item }}</li>
              </ul>
            </div>

          </div>

        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup>
import { watchEffect } from 'vue'

const props = defineProps({
  person: Object,
})

defineEmits(['close'])

watchEffect(() => {
  document.body.style.overflow = props.person ? 'hidden' : ''
})
</script>

<style scoped>
/* ─── Overlay ──────────────────────────────────────────────── */
.overlay {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.78);
  z-index: 2000;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 1.5rem;
}

/* ─── Modal box ────────────────────────────────────────────── */
.modal {
  position: relative;
  display: grid;
  grid-template-columns: 2fr 3fr;
  width: 100%;
  max-width: 900px;
  height: min(640px, 88vh);
  background: var(--bg-secondary);
  border: 1px solid var(--accent-gold);
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 0 0 1px oklch(0.65 0.10 85 / 0.12),
              0 32px 72px rgba(0, 0, 0, 0.65);
}

/* ─── Close button ─────────────────────────────────────────── */
.close-btn {
  position: absolute;
  top: 0.9rem;
  right: 0.9rem;
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background: var(--bg-card);
  border: 1px solid oklch(0.65 0.10 85 / 0.25);
  color: var(--text-secondary);
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  z-index: 10;
  transition: border-color 0.2s, color 0.2s;
}

.close-btn:hover {
  border-color: var(--accent-gold);
  color: var(--accent-gold);
}

/* ─── Photo column (fixed, doesn't scroll) ─────────────────── */
.modal-photo {
  height: 100%;
  background: var(--bg-card);
  overflow: hidden;
}

.modal-photo img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center top;
  display: block;
}

.photo-placeholder {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--text-muted);
}

.photo-placeholder svg {
  width: 80px;
  height: 80px;
}

/* ─── Info column (scrollable) ─────────────────────────────── */
.modal-info {
  height: 100%;
  overflow-y: auto;
  padding: 2rem 2rem 2rem 2.2rem;
  display: flex;
  flex-direction: column;
  gap: 0;
  /* Custom scrollbar */
  scrollbar-width: thin;
  scrollbar-color: oklch(0.65 0.10 85 / 0.3) transparent;
}

.modal-info::-webkit-scrollbar {
  width: 4px;
}

.modal-info::-webkit-scrollbar-track {
  background: transparent;
}

.modal-info::-webkit-scrollbar-thumb {
  background: oklch(0.65 0.10 85 / 0.3);
  border-radius: 2px;
}

/* ─── Identity header ──────────────────────────────────────── */
.modal-identity {
  padding-bottom: 1.2rem;
  margin-bottom: 0.2rem;
  border-bottom: 1px solid oklch(0.65 0.10 85 / 0.18);
}

.modal-apodo {
  font-size: var(--text-xs);
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--accent-gold);
  margin: 0 0 0.2rem;
}

.modal-nombre {
  font-family: 'Bebas Neue', 'Rajdhani', sans-serif;
  font-size: clamp(2rem, 3.5vw, 2.8rem);
  letter-spacing: 0.1em;
  color: var(--text-title);
  margin: 0;
  line-height: 1;
}

/* ─── Sections ─────────────────────────────────────────────── */
.section {
  padding: 0.9rem 0;
  border-bottom: 1px solid oklch(0.65 0.10 85 / 0.08);
}

.section:last-child {
  border-bottom: none;
  padding-bottom: 0;
}

.section-header {
  font-size: var(--text-xs);
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--accent-gold);
  margin: 0 0 0.55rem;
  font-weight: 600;
  opacity: 0.85;
}

.section-body {
  font-size: var(--text-base);
  color: var(--text-secondary);
  line-height: 1.72;
  margin: 0;
}

/* ─── List items ────────────────────────────────────────────── */
.section-list {
  margin: 0;
  padding: 0;
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 0.3rem;
}

.section-list li {
  font-size: var(--text-base);
  color: var(--text-secondary);
  padding-left: 1.1rem;
  position: relative;
  line-height: 1.5;
}

.section-list li::before {
  content: '—';
  position: absolute;
  left: 0;
  color: var(--accent-gold);
  opacity: 0.5;
}

/* ─── Transition ───────────────────────────────────────────── */
.modal-enter-active,
.modal-leave-active {
  transition: opacity 0.22s ease;
}

.modal-enter-active .modal,
.modal-leave-active .modal {
  transition: opacity 0.22s ease, transform 0.22s ease;
}

.modal-enter-from,
.modal-leave-to {
  opacity: 0;
}

.modal-enter-from .modal,
.modal-leave-to .modal {
  opacity: 0;
  transform: scale(0.97) translateY(6px);
}

/* ─── Responsive ───────────────────────────────────────────── */
@media (max-width: 640px) {
  .overlay {
    padding: 0;
    align-items: flex-end;
  }

  .modal {
    grid-template-columns: 1fr;
    grid-template-rows: auto 1fr;
    max-width: 100%;
    height: 92vh;
    border-radius: 14px 14px 0 0;
    border-bottom: none;
  }

  .modal-photo {
    height: 240px;
    flex-shrink: 0;
  }

  .modal-info {
    height: auto;
    padding: 1.4rem 1.2rem 2rem;
  }
}
</style>
