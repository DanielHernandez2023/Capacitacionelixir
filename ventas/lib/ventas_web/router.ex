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
    resources "/clientes", ClienteController

    get "/clientes/nombre/:name", ClienteController, :get_client_by_name
    get "/vendedores/age/:age", VendedorController, :get_saleForce_by_Age

  end
end
