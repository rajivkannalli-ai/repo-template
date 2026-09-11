.PHONY: setup fmt lint typecheck test cov check clean

setup:
	uv sync --all-groups
	uv run pre-commit install

fmt:
	uv run ruff format .
	uv run ruff check --fix .

lint:
	uv run ruff check .

typecheck:
	uv run mypy src

test:
	uv run pytest

cov:
	uv run pytest --cov-report=html
	@echo "Open htmlcov/index.html"

check: lint typecheck test
	uv run gitleaks detect --no-banner

clean:
	rm -rf .venv .pytest_cache .mypy_cache .ruff_cache htmlcov .coverage
