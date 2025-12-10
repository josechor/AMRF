.PHONY: help up-dev up-prod down-dev down-prod build-dev build-prod logs-dev logs-prod restart-dev restart-prod clean

# Colores para output
GREEN := \033[0;32m
YELLOW := \033[0;33m
NC := \033[0m # No Color

help: ## Mostrar ayuda
	@echo "$(GREEN)Comandos disponibles:$(NC)"
	@echo ""
	@echo "$(YELLOW)Desarrollo:$(NC)"
	@echo "  make up-dev       - Levantar entorno de desarrollo con hot-reload"
	@echo "  make down-dev     - Detener entorno de desarrollo"
	@echo "  make build-dev    - Construir imagen de desarrollo"
	@echo "  make logs-dev     - Ver logs de desarrollo"
	@echo "  make restart-dev  - Reiniciar contenedor de desarrollo"
	@echo ""
	@echo "$(YELLOW)Producción:$(NC)"
	@echo "  make up-prod      - Levantar entorno de producción"
	@echo "  make down-prod    - Detener entorno de producción"
	@echo "  make build-prod   - Construir imagen de producción"
	@echo "  make logs-prod    - Ver logs de producción"
	@echo "  make restart-prod - Reiniciar contenedor de producción"
	@echo ""
	@echo "$(YELLOW)Utilidades:$(NC)"
	@echo "  make clean        - Limpiar contenedores e imágenes"

# ==================== DESARROLLO ====================

up-dev: ## Levantar entorno de desarrollo con hot-reload
	@echo "$(GREEN)🚀 Levantando entorno de desarrollo...$(NC)"
	docker compose -f docker-compose.dev.yml up --build -d
	@echo "$(GREEN)✓ Desarrollo disponible en http://localhost:5174$(NC)"

down-dev: ## Detener entorno de desarrollo
	@echo "$(YELLOW)🛑 Deteniendo entorno de desarrollo...$(NC)"
	docker compose -f docker-compose.dev.yml down

build-dev: ## Construir imagen de desarrollo
	@echo "$(GREEN)🔨 Construyendo imagen de desarrollo...$(NC)"
	docker compose -f docker-compose.dev.yml build

logs-dev: ## Ver logs de desarrollo
	docker compose -f docker-compose.dev.yml logs -f

restart-dev: down-dev up-dev ## Reiniciar contenedor de desarrollo

# ==================== PRODUCCIÓN ====================

up-prod: ## Levantar entorno de producción
	@echo "$(GREEN)🚀 Levantando entorno de producción...$(NC)"
	docker compose up --build -d
	@echo "$(GREEN)✓ Producción disponible en http://localhost:5174$(NC)"

down-prod: ## Detener entorno de producción
	@echo "$(YELLOW)🛑 Deteniendo entorno de producción...$(NC)"
	docker compose down

build-prod: ## Construir imagen de producción
	@echo "$(GREEN)🔨 Construyendo imagen de producción...$(NC)"
	docker compose build

logs-prod: ## Ver logs de producción
	docker compose logs -f

restart-prod: down-prod up-prod ## Reiniciar contenedor de producción

# ==================== UTILIDADES ====================

clean: ## Limpiar contenedores e imágenes
	@echo "$(YELLOW)🧹 Limpiando contenedores e imágenes...$(NC)"
	docker compose down -v
	docker compose -f docker-compose.dev.yml down -v
	docker system prune -f
	@echo "$(GREEN)✓ Limpieza completada$(NC)"
