defmodule Ventas.Repo do
  use Ecto.Repo,
    otp_app: :ventas,
    adapter: Ecto.Adapters.Postgres
end
