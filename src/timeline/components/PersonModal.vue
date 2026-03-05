<template>
  <Teleport to="body">
    <Transition name="modal">
      <div v-if="person" class="overlay" @click.self="$emit('close')">
        <div class="modal" role="dialog" :aria-label="person.nombre">

          <button class="close-btn" @click="$emit('close')" aria-label="Cerrar">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">
              <line x1="18" y1="6" x2="6" y2="18"/>
              <line x1="6" y1="6" x2="18" y2="18"/>
            </svg>
          </button>

          <!-- Left: photo -->
          <div class="modal-photo">
            <img v-if="person.imagen" :src="person.imagen" :alt="person.nombre" />
            <div v-else class="photo-placeholder">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="8" r="4.5"/>
                <path d="M3 21c0-4.5 4-8 9-8s9 3.5 9 8"/>
              </svg>
            </div>
          </div>

          <!-- Right: info -->
          <div class="modal-info">
            <p class="modal-apodo">{{ person.apodo }}</p>
            <h2 class="modal-nombre">{{ person.nombre }}</h2>
            <div class="modal-divider"></div>
            <p class="modal-descripcion">{{ person.descripcion }}</p>
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

// Lock body scroll while modal is open
watchEffect(() => {
  document.body.style.overflow = props.person ? 'hidden' : ''
})
</script>

<style scoped>
/* ─── Overlay ──────────────────────────────────────────────── */
.overlay {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.75);
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
  max-width: 860px;
  max-height: 90vh;
  background: var(--bg-secondary);
  border: 1px solid var(--accent-gold);
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 0 0 1px oklch(0.65 0.10 85 / 0.15),
              0 24px 60px rgba(0, 0, 0, 0.6);
}

/* ─── Close button ─────────────────────────────────────────── */
.close-btn {
  position: absolute;
  top: 1rem;
  right: 1rem;
  width: 34px;
  height: 34px;
  border-radius: 50%;
  background: var(--bg-card);
  border: 1px solid oklch(0.65 0.10 85 / 0.3);
  color: var(--text-secondary);
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  z-index: 1;
  transition: border-color 0.2s, color 0.2s;
}

.close-btn:hover {
  border-color: var(--accent-gold);
  color: var(--accent-gold);
}

/* ─── Photo column ─────────────────────────────────────────── */
.modal-photo {
  min-height: 420px;
  max-height: 90vh;
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

/* ─── Info column ──────────────────────────────────────────── */
.modal-info {
  padding: 2.5rem 2rem 2.5rem 2.2rem;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  overflow-y: auto;
}

.modal-apodo {
  font-size: var(--text-xs);
  letter-spacing: 0.16em;
  text-transform: uppercase;
  color: var(--accent-gold);
  margin: 0;
}

.modal-nombre {
  font-family: 'Bebas Neue', 'Rajdhani', sans-serif;
  font-size: clamp(2rem, 4vw, 2.8rem);
  letter-spacing: 0.1em;
  color: var(--text-title);
  margin: 0;
  line-height: 1.1;
}

.modal-divider {
  width: 40px;
  height: 2px;
  background: var(--accent-gold);
  opacity: 0.6;
  margin: 0.8rem 0;
}

.modal-descripcion {
  font-size: var(--text-base);
  color: var(--text-secondary);
  line-height: 1.75;
  margin: 0;
}

/* ─── Transition ───────────────────────────────────────────── */
.modal-enter-active,
.modal-leave-active {
  transition: opacity 0.25s ease;
}

.modal-enter-active .modal,
.modal-leave-active .modal {
  transition: opacity 0.25s ease, transform 0.25s ease;
}

.modal-enter-from,
.modal-leave-to {
  opacity: 0;
}

.modal-enter-from .modal,
.modal-leave-to .modal {
  opacity: 0;
  transform: scale(0.96) translateY(8px);
}

/* ─── Responsive ───────────────────────────────────────────── */
@media (max-width: 640px) {
  .overlay {
    padding: 0;
    align-items: flex-end;
  }

  .modal {
    grid-template-columns: 1fr;
    max-width: 100%;
    max-height: 92vh;
    border-radius: 12px 12px 0 0;
    border-bottom: none;
  }

  .modal-photo {
    min-height: 260px;
    max-height: 40vh;
  }

  .modal-info {
    padding: 1.5rem 1.2rem 2rem;
  }
}
</style>
