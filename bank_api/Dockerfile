FROM python:3.11.5

RUN pip install poetry

RUN mkdir /app

WORKDIR /app

COPY poetry.lock pyproject.toml /app/

RUN poetry config virtualenvs.create false

RUN poetry install --only main

COPY . .

CMD ["python", "app.py"]
