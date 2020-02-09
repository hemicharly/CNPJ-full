# Build application python
python-build:
	docker-compose -f docker-compose.cli.yml build

# Execution application python
dcli-python=docker-compose -f docker-compose.cli.yml run cnpj-full-cli python cnpj.py
python-run:
	$(dcli-python) "data" csv "database" --dir

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
elk-run: elasticsearch-run kibana-run logstash-run

# Stop all container elk
elk-stop:
	docker-compose -f docker-compose-elk.yml stop