defmodule VentasWeb.Router do
  use VentasWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", VentasWeb do
    pipe_through :api
  end
end
