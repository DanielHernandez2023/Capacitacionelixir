defmodule VentasWeb.Router do

  alias VentasWeb.ClienteController
  alias VentasWeb.VendedorController
  use VentasWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api"  do
    pipe_through :api

    resources "/vendedores", VendedorController
    resources "/clientes", ClientesController



  end
end
