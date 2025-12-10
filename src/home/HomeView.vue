<template>
  <div class="home">
    <!-- Mini panel romántico de bienvenida -->
    <div class="welcome-card">
      <h1 class="greeting">Hola amor ❤️</h1>
      <div class="stats">
        <p class="days-together">
          Hoy es nuestro día <span class="highlight">nº {{ daysTogether }}</span> juntos
        </p>
        <p class="next-plan" v-if="daysUntilNextPlan !== null">
          Faltan <span class="highlight">{{ daysUntilNextPlan }} {{ daysUntilNextPlan === 1 ? 'día' : 'días' }}</span> para nuestro siguiente plan
        </p>
        <p class="no-plan" v-else>
          Aún no tenemos ningún plan programado 😢
        </p>
      </div>
    </div>

    <!-- Accesos directos -->
    <div class="shortcuts">
      <router-link to="/timeline" class="shortcut-card">
        <span class="icon">❤️</span>
        <span class="label">Timeline</span>
      </router-link>
      
      <router-link to="/map" class="shortcut-card">
        <span class="icon">📍</span>
        <span class="label">Lugares visitados</span>
      </router-link>
      
      <router-link to="/weekly-quiz" class="shortcut-card">
        <span class="icon">❓</span>
        <span class="label">Quiz semanal</span>
      </router-link>
      
      <router-link to="/future-plans" class="shortcut-card">
        <span class="icon">✨</span>
        <span class="label">Planes futuros</span>
      </router-link>
      
      <router-link to="/map" class="shortcut-card">
        <span class="icon">🗺️</span>
        <span class="label">Mapa</span>
      </router-link>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

// Fecha de inicio de la relación: 12 de noviembre de 2024
const startDate = new Date('2025-11-12')

// Calcular días juntos
const daysTogether = computed(() => {
  const today = new Date()
  const diffTime = Math.abs(today - startDate)
  const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
  return diffDays
})

// Días hasta el próximo plan (puedes cambiar esto a null si no hay plan)
// Ejemplo: const daysUntilNextPlan = ref(3)
// Si no hay plan: const daysUntilNextPlan = ref(null)
const daysUntilNextPlan = ref(3)
</script>

<style scoped>
.home {
  padding: 2rem;
  max-width: 600px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: calc(100vh - 80px);
}

/* Card de bienvenida */
.welcome-card {
  background: var(--bg-card);
  padding: 3rem 2.5rem;
  border-radius: 30px;
  box-shadow: 0 8px 24px var(--shadow-soft);
  text-align: center;
  width: 100%;
  border: 3px solid var(--primary-rose);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.welcome-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 32px var(--shadow-medium);
}

.greeting {
  color: var(--accent-love);
  font-size: 2.5rem;
  margin-bottom: 2rem;
  font-weight: 700;
  animation: pulse 2s ease-in-out infinite;
}

@keyframes pulse {
  0%, 100% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.05);
  }
}

.stats {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.days-together,
.next-plan,
.no-plan {
  font-size: 1.3rem;
  color: var(--text-primary);
  line-height: 1.6;
  margin: 0;
  font-weight: 500;
}

.highlight {
  color: var(--accent-love);
  font-weight: 700;
  font-size: 1.5em;
  display: inline-block;
  padding: 0 0.3rem;
}

.no-plan {
  color: var(--text-secondary);
  font-style: italic;
  font-size: 1.2rem;
}

/* Accesos directos */
.shortcuts {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
  gap: 1.5rem;
  width: 100%;
  margin-top: 3rem;
}

.shortcut-card {
  background: var(--bg-card);
  padding: 2rem 1.5rem;
  border-radius: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1rem;
  text-decoration: none;
  border: 2px solid var(--primary-rose);
  box-shadow: 0 4px 12px var(--shadow-soft);
  transition: all 0.3s ease;
  cursor: pointer;
}

.shortcut-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 8px 20px var(--shadow-medium);
  border-color: var(--accent-love);
}

.shortcut-card .icon {
  font-size: 3rem;
  transition: transform 0.3s ease;
}

.shortcut-card:hover .icon {
  transform: scale(1.2) rotate(10deg);
}

.shortcut-card .label {
  color: var(--text-primary);
  font-weight: 600;
  font-size: 0.95rem;
  text-align: center;
  line-height: 1.3;
}

/* Responsive */
@media (max-width: 768px) {
  .home {
    padding: 1.5rem;
    min-height: calc(100vh - 70px);
  }

  .welcome-card {
    padding: 2rem 1.5rem;
    border-radius: 20px;
  }

  .greeting {
    font-size: 2rem;
    margin-bottom: 1.5rem;
  }

  .days-together,
  .next-plan,
  .no-plan {
    font-size: 1.1rem;
  }

  .highlight {
    font-size: 1.3em;
  }

  .shortcuts {
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
    margin-top: 2rem;
  }

  .shortcut-card {
    padding: 1.5rem 1rem;
  }

  .shortcut-card .icon {
    font-size: 2.5rem;
  }

  .shortcut-card .label {
    font-size: 0.85rem;
  }
}

@media (max-width: 480px) {
  .greeting {
    font-size: 1.8rem;
  }

  .days-together,
  .next-plan,
  .no-plan {
    font-size: 1rem;
  }

  .shortcuts {
    grid-template-columns: repeat(2, 1fr);
  }

  .shortcut-card .icon {
    font-size: 2.2rem;
  }
}
</style>
