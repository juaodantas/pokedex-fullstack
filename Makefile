start-all:
	docker-compose up -d &
	cd backend
	npm start