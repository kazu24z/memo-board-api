# python3.9のイメージをダウンロード
FROM python:3.10-bullseye
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/src

WORKDIR /src

# pipを使ってpoetryをインストール
RUN pip install poetry

# poetryの定義ファイルをコピー (存在する場合)
COPY pyproject.toml poetry.lock ./

# poetryでライブラリをインストール (pyproject.tomlが既にある場合)
RUN if [ -f pyproject.toml ]; then poetry install --no-root; fi


# uvicornのサーバーを立ち上げる
ENTRYPOINT ["poetry", "run", "uvicorn", "api.main:app", "--host", "0.0.0.0", "--reload"]
