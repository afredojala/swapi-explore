
evidence-update:
	npm --prefix ./reports update

evidence-dev:
	# When not using buenavista
	npm --prefix ./reports run dev #> /dev/null 2>&1 &

evidence-build:
	npm --prefix ./reports run build

evidence-run:
	make evidence-update
	make evidence-build

run-buenavista:
	python3 -m duckdbt.server > /dev/null 2>&1 &

run-dbt:
	.venv/bin/python starter/template_engine.py
	.venv/bin/dbt run --profiles-dir $$(pwd)


prequisite:
	@python3 -m venv .venv
	@.venv/bin/pip install -r requirements.txt
	@.venv/bin/python starter/template_engine.py
	make evidence-update


create-report:
	. .venv/bin/activate
	make run-dbt
	make evidence-run
	make launch-nginx

launch-nginx:
	docker run -p 3000:3000 \
		-v $$(pwd)/nginx/default.conf:/etc/nginx/conf.d/default.conf \
		-v $$(pwd)/reports/build/:/www/evidence/ \
		--name evidence-server --rm nginx
