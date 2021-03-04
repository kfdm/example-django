APP_BIN := .venv/bin/example-django
PIP_BIN := .venv/bin/pip

.DEFAULT: test

.PHONY: test
test: ${APP_BIN}
	${APP_BIN} test -v 2

$(PIP_BIN):
	python3 -m venv .venv

${APP_BIN}: $(PIP_BIN)
	${PIP_BIN} install -r docker/requirements.txt
	${PIP_BIN} install -e .[dev,standalone]
