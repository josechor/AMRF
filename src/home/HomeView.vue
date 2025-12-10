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
}
</style>
