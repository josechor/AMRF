# AMRF - Proyecto Vue 3 + Vite

Aplicación web modular construida con Vue 3 y Vite, con una arquitectura basada en pantallas independientes.

## 📁 Estructura del Proyecto

```
src/
 ├── home/                   # Página principal
 │     ├── HomeView.vue
 │     └── components/
 ├── timeline/              # Línea de tiempo
 │     ├── TimelineView.vue
 │     └── components/
 ├── map/                   # Visualización de mapa
 │     ├── MapView.vue
 │     └── components/
 ├── weekly-quiz/           # Quiz semanal
 │     ├── WeeklyQuizView.vue
 │     └── components/
 ├── future-plans/          # Planes futuros
 │     ├── FuturePlansView.vue
 │     └── components/
 ├── shared/                # Recursos compartidos
 │     ├── components/      # Componentes reutilizables (header, footer, etc)
 │     └── assets/          # Imágenes, iconos, fuentes globales
 ├── router/                # Configuración de rutas
 │     └── index.js
 └── App.vue                # Componente principal
```

## 🚀 Rutas Disponibles

- `/` → Home (página principal)
- `/timeline` → Timeline
- `/map` → Mapa
- `/weekly-quiz` → Quiz Semanal
- `/future-plans` → Planes Futuros

## 🐳 Despliegue con Docker

### Construir la imagen

```bash
docker-compose build
```

### Levantar el contenedor

```bash
docker-compose up -d
```

### Acceder a la aplicación

Abre tu navegador en: **http://localhost:5174**

### Detener el contenedor

```bash
docker-compose down
```

### Ver logs del contenedor

```bash
docker-compose logs -f
```

## 💻 Desarrollo Local (sin Docker)

### Instalar dependencias

```bash
npm install
```

### Ejecutar en modo desarrollo

```bash
npm run dev
```

La aplicación estará disponible en: **http://localhost:5174**

### Compilar para producción

```bash
npm run build
```

### Previsualizar build de producción

```bash
npm run preview
```

## 🛠 Tecnologías

- **Vue 3** - Framework JavaScript progresivo
- **Vite** - Build tool ultrarrápido
- **Vue Router 4** - Enrutamiento oficial de Vue
- **Docker** - Containerización
- **Nginx** - Servidor web para producción

## 📝 Notas

- El proyecto usa una arquitectura modular donde cada pantalla tiene su propia carpeta
- NO se usa la carpeta tradicional `/src/views`
- Los componentes compartidos están en `/src/shared/components`
- La configuración de Docker usa multi-stage build para optimizar el tamaño de la imagen
- Nginx sirve la aplicación en producción con soporte para Vue Router en modo history

## 🏗️ Próximos Pasos

Esta es la estructura base del proyecto. Las funcionalidades específicas de cada sección se implementarán posteriormente:

- [ ] Implementar funcionalidad de Timeline
- [ ] Integrar mapa interactivo
- [ ] Desarrollar sistema de quiz semanal
- [ ] Crear formulario de planes futuros
- [ ] Agregar estilos y diseño global

