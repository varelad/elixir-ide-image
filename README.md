# elixir-ide-image

Construye y publica la imagen del entorno de Elixir que usan los codespaces de
**Programación Lógica y Funcional (SCC-1019)**. Los alumnos no abren este repo:
usan la plantilla [`elixir-ide-template`](https://github.com/varelad/elixir-ide-template), que
sólo descarga la imagen publicada aquí.

## Qué trae la imagen

| Componente | Para qué |
|---|---|
| Elixir 1.20 (imagen oficial `elixir:1.20`) | Versión fija para todo el grupo |
| Hex y Rebar | `mix new`, `mix deps.get` y `mix test` funcionan desde el primer minuto |
| Livebook (escript) | Cuadernos interactivos |
| git, inotify-tools | Utilerías del sistema |
| PLT base de Dialyzer | `mix dialyzer` tarda segundos, no minutos, la primera vez |
| Extensión ElixirLS | Se instala sola en VS Code; Dialyzer del editor apagado |

La imagen se publica para **amd64** (Codespaces, PCs con Intel o AMD) y **arm64**
(Mac con Apple Silicon). Docker descarga sola la que corresponde a cada máquina.

Las versiones de Livebook, Hex y del PLT quedan congeladas en el momento de
construir la imagen: una etiqueta = un entorno idéntico para todos.

## Construir y publicar

1. **Actions → Construir imagen → Run workflow**, con la etiqueta del semestre
   (por ejemplo `2026b`).
2. La primera vez: en tu perfil, **Packages → elixir-ide-image → Package settings →
   Change visibility → Public**. Sin esto, los alumnos no pueden descargarla.
3. Verifica que la etiqueta coincida con la de
   `elixir-ide-template/.devcontainer/devcontainer.json`.

El workflow construye cada arquitectura en su propio runner (el de arm64 es
gratuito sólo si este repo es público), publica `2026b-amd64` y `2026b-arm64`,
y al final las une bajo `2026b`. Cada construcción comprueba la arquitectura, la versión de Elixir, que Livebook esté
instalado y que exista el PLT base.

## Reglas de etiquetas

- **Una etiqueta por semestre, nunca `latest`.**
- **No reconstruyas una etiqueta ya en uso.** Si hay que corregir algo a mitad
  de semestre, publica una nueva (`2026b.1`) y actualiza la plantilla.

## Antes de la primera clase

- [ ] Crear un codespace desde la plantilla y medir cuánto tarda en abrir.
- [ ] `elixir --version` muestra 1.20.
- [ ] `livebook server` abre en el navegador y ejecuta una celda.
- [ ] En un proyecto nuevo, ElixirLS termina de arrancar y marca errores.
- [ ] Con `dialyxir` agregado, `mix dialyzer` no reconstruye el PLT base.

## Pendiente

La primera vez que ElixirLS arranca en un codespace se compila contra la
versión de Elixir instalada (uno o dos minutos). Si se logra precalentar esa
compilación en la imagen, se agrega aquí.

## Semestre siguiente

Revisar la versión de Elixir, evaluar Expert (el language server oficial,
en alfa en 2026) como reemplazo de ElixirLS, construir con etiqueta nueva y
actualizar la plantilla.
