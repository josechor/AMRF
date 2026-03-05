<template>
  <div class="person-card" :class="{ 'card-featured': featured }" @click="handleClick">
    <div class="photo-ring" :class="{ 'photo-ring--featured': featured }">
      <img :src="getImage(imagen)" :alt="nombre" />
    </div>
    <p class="person-name">{{ apodo }}</p>
    <p class="person-label">{{ nombre }}</p>
  </div>
</template>

<script setup>
const props = defineProps({
  apodo: String,
  nombre: String,
  imagen: String,
  featured: Boolean,
  // Modal fields (not rendered by the card, just passed through)
  descripcion: String,
  especialidad: String,
  gustos: Array,
  habilidades: Array,
  debilidades: Array,
})

const emit = defineEmits(['select'])

const getImage = (img) => {
  return new URL(`../../shared/assets/Images/Familia/${img}`, import.meta.url).href
}

function handleClick() {
  emit('select', {
    apodo: props.apodo,
    nombre: props.nombre,
    imagen: props.imagen ? getImage(props.imagen) : null,
    descripcion: props.descripcion,
    especialidad: props.especialidad,
    gustos: props.gustos,
    habilidades: props.habilidades,
    debilidades: props.debilidades,
  })
}
</script>

<style scoped>
.person-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.8rem;
  padding: 0 0.5rem 1.4rem;
  cursor: pointer;
}

.person-card:hover .photo-ring {
  border-color: var(--accent-gold);
  box-shadow: 0 0 0 3px oklch(0.65 0.10 85 / 0.15);
}

.person-card:hover .person-name {
  color: var(--accent-gold);
}

.person-name {
  font-size: var(--text-lg);
  font-weight: 600;
  color: var(--text-primary);
  margin: 0;
  letter-spacing: 0.03em;
  transition: color 0.2s;
}

.person-label {
  font-size: var(--text-sm);
  color: var(--text-secondary);
  letter-spacing: 0.07em;
  text-transform: uppercase;
  margin: 0;
}

.card-featured .person-name {
  color: var(--accent-gold);
}

/* ─── Photo ring ───────────────────────────────────────────── */
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
  transition: border-color 0.2s, box-shadow 0.2s;
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

/* ─── Responsive ───────────────────────────────────────────── */
@media (max-width: 1024px) {
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
}
</style>
