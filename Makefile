# Build application python
build:
	docker-compose -f docker-compose.cli.yml build


# Command to execute application in container
dcli-python=docker-compose -f docker-compose.cli.yml run cnpj-full-cli python cnpj.py

# Execution application python using csv
run-csv:
	$(dcli-python) "data" csv "database" --dir

# Execution application python using sqlite
run-sqlite:
	$(dcli-python) "data" sqlite "database" --dir

# Execution elasticsearch container
elasticsearch-run:
	docker-compose -f docker-compose-elk.yml up -d --build elasticsearch

# Execution kibana container
kibana-run:
	docker-compose -f docker-compose-elk.yml up -d --build kibana

# Execution container elasticsearch and kibana
ek-run: elasticsearch-run kibana-run

# Execution logstash container
logstash-run:
	docker-compose -f docker-compose-elk.yml up -d --build logstash

# Stop logstash container
logstash-stop:
	docker-compose -f docker-compose-elk.yml stop logstash

# Execution all container elk
elk-run:
	docker-compose -f docker-compose-elk.yml up -d --build

# Stop all container elk
elk-stop:
	docker-compose -f docker-compose-elk.yml stop

# Restart all container elk
elk-restart: elk-stop elk-run