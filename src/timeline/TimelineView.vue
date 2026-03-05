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
          <div class="tree-label">Raíces del Don</div>

          <div class="tree-grid">
            <PersonCard v-bind="ramon" @select="openModal" />
            <PersonCard v-bind="estela" @select="openModal" />

            <!-- 2 parents → 1 child -->
            <svg
              class="tree-svg"
              viewBox="0 0 100 60"
              preserveAspectRatio="none"
            >
              <line x1="25" y1="0" x2="75" y2="0" class="tree-line" />
              <line x1="50" y1="0" x2="50" y2="60" class="tree-line" />
            </svg>

            <PersonCard class="card-solo" v-bind="jose" @select="openModal" />
          </div>
        </div>

        <!-- ── VERTICAL DIVIDER ── -->
        <div class="trees-divider"></div>

        <!-- ── RIGHT TREE: Ainoa ── -->
        <div class="tree-panel">
          <div class="tree-label">Raíces de la Donna</div>

          <div class="tree-grid">
            <PersonCard v-bind="ignacio" @select="openModal" />
            <PersonCard v-bind="marina" @select="openModal" />

            <!-- 2 parents → 2 children (forked) -->
            <svg
              class="tree-svg"
              viewBox="0 0 100 60"
              preserveAspectRatio="none"
            >
              <line x1="25" y1="0" x2="75" y2="0" class="tree-line" />
              <line x1="50" y1="0" x2="50" y2="30" class="tree-line" />
              <line x1="25" y1="30" x2="75" y2="30" class="tree-line" />
              <line x1="25" y1="30" x2="25" y2="60" class="tree-line" />
              <line x1="75" y1="30" x2="75" y2="60" class="tree-line" />
            </svg>

            <PersonCard v-bind="ainoa" @select="openModal" />
            <PersonCard v-bind="noemi" @select="openModal" />
          </div>
        </div>
      </div>
    </div>

    <!-- ─────────────────── MODAL ─────────────────── -->
    <PersonModal :person="selectedPerson" @close="closeModal" />
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from "vue";
import PersonCard from "./components/PersonCard.vue";
import PersonModal from "./components/PersonModal.vue";

// ── Person data ────────────────────────────────────────────────
const TODO = "Información pendiente. Esta sección se completará próximamente.";
const TODO_LIST = ["Por definir"];

const ramon = {
  apodo: "El Patriarca",
  nombre: "Ramón",
  imagen: "Ramon.png",
  descripcion:
    "El pilar de la familia, con un ojo en todo y las manos en todo lo demás. Ramón combina paciencia, ingenio y un amor por la rutina que nadie entiende. Siempre ocupado con sus sudokus, el fútbol o las cartas en el bar, pero cuando la familia lo necesita, está ahí, listo para resolver cualquier problema.",
  especialidad: "Organización, resolución de problemas y mantener la calma en cualquier situación.",
  gustos: [
    "Fútbol y seguir cada partido al detalle",
    "Resolver sudokus y acertijos complicados",
    "Jugar a las cartas con amigos en el bar",
    "Proyectos de bricolaje y arreglar cosas en casa",
  ],
  habilidades: [
    "Resolver problemas de forma práctica y rápida",
    "Hacer varias cosas a la vez sin perder el hilo",
    "Paciencia infinita (aunque se duerma durante el partido)",
    "Versatilidad: capaz de arreglar casi cualquier cosa",
  ],
  debilidades: [
    "Se distrae fácilmente con sus pasatiempos",
    "Tiende a dormirse en los momentos más inesperados",
    "A veces prioriza la rutina sobre lo urgente",
    "Puede ser terco con sus métodos",
  ],
};

const estela = {
  apodo: "La Matriarca",
  nombre: "Estela",
  imagen: "Estela.png",
  descripcion:
    "El corazón de la familia, siempre presente aunque el mundo se descontrole. Estela tiene una habilidad innata para meterse en todos los asuntos, a veces demasiado, pero siempre con la mejor intención. Su timidez y torpeza esconden un carácter amable y gracioso que hace que todos confíen en ella.",
  especialidad: "Mantener unida a la familia y mediar en conflictos, aunque sea a su manera.",
  gustos: [
    "Reuniones familiares y cafés largos",
    "Películas y series ligeras",
    "Pequeños detalles que alegran el día",
    "Ayudar a los demás, incluso cuando nadie lo pide",
  ],
  habilidades: [
    "Estar siempre presente para quienes quiere",
    "Capacidad de mediar y suavizar tensiones",
    "Empatía y amabilidad innata",
    "Hacer reír incluso en momentos tensos",
  ],
  debilidades: [
    "Se pone nerviosa ante cualquier problema",
    "Puede ser torpe y despistada",
    "Hace siempre lo que ella quiere, aunque digan que no",
  ],
};

const jose = {
  apodo: "Don",
  nombre: "José",
  imagen: "Jose.png",
  featured: true,
  descripcion:
    "La mente detrás del plan. Siempre tranquilo, siempre calculando. José no levanta la voz, pero cuando habla todos escuchan. Con un puro en la boca y un plan en la cabeza, convierte cualquier problema en una oportunidad.",
  especialidad: "Estrategia y toma de decisiones bajo presión.",
  gustos: [
    "Coches rápidos por la noche",
    "Café fuerte y conversaciones largas",
    "Videojuegos competitivos",
    "La música que suena mientras conduces sin rumbo",
  ],
  habilidades: [
    "Pensamiento estratégico",
    "Resolver problemas rápidamente",
    "Liderazgo natural",
    "Mantener la calma en situaciones caóticas",
  ],
  debilidades: [
    "A veces piensa demasiado antes de actuar",
    "No le gusta perder ni a las chapas",
  ],
};

const ignacio = {
  apodo: "Il Vecchio",
  nombre: "Ignacio",
  imagen: "Ignacio.png",
  descripcion:
    "El tío parlanchín que nunca se queda callado. Ignacio entra en cualquier conversación sin filtro y con una sonrisa, siempre listo para un buen vino y una buena historia. Amante de la velocidad y del riesgo, ya sea en coches, motos o en la vida misma.",
  especialidad: "Persuasión, negociación y mantener el ambiente siempre animado.",
  gustos: [
    "Vino de calidad y largas sobremesas",
    "Fútbol, especialmente seguir al Real Madrid",
    "Coches deportivos y motos potentes",
    "Charlas interminables y contar anécdotas",
  ],
  habilidades: [
    "Hablar y convencer a casi cualquiera",
    "Crear buen ambiente en cualquier reunión",
    "Multitarea social: escucha, habla y dirige conversaciones",
    "Disfrutar de la vida sin preocuparse demasiado",
  ],
  debilidades: [
    "Cero vergüenza y sin filtro, a veces dice lo que no debe",
    "Se entusiasma demasiado y puede distraerse",
    "Confía rápido en la gente sin pensarlo mucho",
    "No sabe decir que no al vino ni a una buena charla",
  ],
};

const marina = {
  apodo: "La Matriarca",
  nombre: "Marina",
  imagen: "Marina.png",
  descripcion:
    "Amable pero firme, Marina es la voz que todos escuchan aunque no siempre estén de acuerdo. Siempre acompañada de su fiel perro, protege a los suyos con determinación y no duda en poner límites cuando hace falta. Su carácter fuerte y su afecto cercano la hacen imposible de ignorar.",
  especialidad: "Protección de la familia y manejo de conflictos familiares.",
  gustos: [
    "Conversaciones largas y sinceras",
    "Pasar tiempo con su perro fiel",
    "Cocina casera y pequeños placeres cotidianos",
    "Discutir con cariño cuando hace falta",
  ],
  habilidades: [
    "Protección y cuidado de los suyos",
    "Mediar y pelear con firmeza cuando la situación lo requiere",
    "Conectar con las personas de manera cercana y honesta",
    "Mantener la calma bajo presión y supervisar la familia",
  ],
  debilidades: [
    "Suele discutir bastante con su hija",
    "Puede ser demasiado entrometida en asuntos ajenos",
    "Le cuesta pasar desapercibida por su personalidad fuerte",
    "A veces sobreprotege a quienes quiere",
  ],
};
const ainoa = {
  apodo: "Donna",
  nombre: "Ainoa",
  imagen: "Ainoa.png",
  featured: true,
  descripcion:
    "La reina de la noche y los secretos. Ainoa no necesita demostrar nada; su mirada lo dice todo. Siempre elegante y letal, maneja los hilos detrás del telón y sabe cuándo aparecer y cuándo desaparecer. Cada movimiento suyo deja huella.",
  especialidad: "Inteligencia, espionaje y manipulación de información.",
  gustos: [
    "Cigarros finos y whisky con hielo",
    "Moda elegante y accesorios únicos",
    "Juegos de estrategia en la vida real",
    "Música de jazz y blues en locales ocultos",
  ],
  habilidades: [
    "Leer a las personas al instante",
    "Manipulación sutil y persuasiva",
    "Planificación y logística precisa",
    "Mantener secretos y proteger aliados",
  ],
  debilidades: [
    "Confía demasiado en quienes considera leales",
    "A veces deja que las emociones guíen sus decisiones",
    "No soporta la traición bajo ninguna forma",
  ],
};

const noemi = {
  apodo: "La Sorella",
  nombre: "Noemi",
  imagen: "Noemi.png",
  descripcion:
    "La hermana silenciosa que observa más de lo que habla. Noemi tiene un aire discreto, pero no subestimes su intuición. Siempre presente cuando hace falta, y con un toque de dulzura que desconcierta incluso a los más duros.",
  especialidad: "Recopilar información y mediar conflictos sin llamar la atención.",
  gustos: [
    "Cocina vegana creativa",
    "Plantas y pequeños jardines urbanos",
    "Series y películas con misterio",
    "Tarde de cafés tranquilos y charlas suaves",
  ],
  habilidades: [
    "Detectar tensiones y calmar situaciones",
    "Observar detalles que otros pasan por alto",
    "Mantener la calma incluso bajo presión",
    "Lealtad y discreción absoluta",
  ],
  debilidades: [
    "Tímida y reservada, a veces se pierde en la sombra",
    "Se preocupa demasiado por los demás",
    "Puede ser influenciable por personas cercanas",
  ],
};

// ── Modal state ────────────────────────────────────────────────
const selectedPerson = ref(null);

function openModal(person) {
  selectedPerson.value = person;
}

function closeModal() {
  selectedPerson.value = null;
}

function onKeydown(e) {
  if (e.key === "Escape") closeModal();
}

onMounted(() => window.addEventListener("keydown", onKeydown));
onUnmounted(() => window.removeEventListener("keydown", onKeydown));
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
  font-family: "Bebas Neue", "Rajdhani", sans-serif;
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
.tree-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  column-gap: 0;
  row-gap: 0;
  justify-items: center;
  width: 100%;
}

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
