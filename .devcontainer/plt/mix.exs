# Proyecto desechable: sólo sirve para construir el PLT base de Dialyzer
# durante la construcción de la imagen. Se borra al terminar.
defmodule Plt.MixProject do
  use Mix.Project

  def project do
    [
      app: :plt,
      version: "0.1.0",
      deps: [{:dialyxir, "~> 1.4", runtime: false}]
    ]
  end
end
