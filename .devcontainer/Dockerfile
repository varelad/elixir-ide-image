# Imagen del entorno de Elixir para Programación Lógica y Funcional (SCC-1019)
# Todo lo que tarda se instala aquí, una sola vez, al construir la imagen.

FROM elixir:1.20

# Utilerías del sistema
RUN apt-get update \
 && apt-get install -y --no-install-recommends git inotify-tools \
 && rm -rf /var/lib/apt/lists/*

# Hex, Rebar y Livebook
RUN mix local.hex --force \
 && mix local.rebar --force \
 && mix escript.install hex livebook --force

ENV PATH="/root/.mix/escripts:${PATH}"

# PLT base de Dialyzer (Erlang + biblioteca estándar de Elixir).
# dialyxir lo busca en ~/.mix, así que los proyectos de los alumnos
# lo encuentran sin configuración y sólo agregan sus propias dependencias.
COPY plt /tmp/plt
RUN cd /tmp/plt \
 && mix deps.get \
 && mix dialyzer --plt \
 && rm -rf /tmp/plt
