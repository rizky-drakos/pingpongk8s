FROM python:3.6-alpine as build
COPY ["requirements.txt", "./"]

RUN apk update \
    && python -m pip install --upgrade pip \
    && python -m pip wheel --wheel-dir=/wheels -r requirements.txt

FROM python:3.6-alpine
WORKDIR /ping
COPY --from=build /wheels /wheels
COPY ["main.py", "./"]
RUN python -m pip install --upgrade pip \
    && python -m pip install /wheels/*
ENTRYPOINT [ "python", "main.py" ]
