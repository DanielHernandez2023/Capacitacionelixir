defmodule VentasWeb.VendedorController do
  use VentasWeb, :controller

  alias Ventas.Vendedores
  alias Ventas.Vendedores.Vendedor

  action_fallback VentasWeb.FallbackController

  def index(conn, _params) do
    vendedores = Vendedores.list_vendedores()
    render(conn, :index, vendedores: vendedores)
  end

  def create(conn, %{"vendedor" => vendedor_params}) do
    with {:ok, %Vendedor{} = vendedor} <- Vendedores.create_vendedor(vendedor_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", ~p"/api/vendedores/#{vendedor}")
      |> render(:show, vendedor: vendedor)
    end
  end

  def show(conn, %{"id" => id}) do
    vendedor = Vendedores.get_vendedor!(id)
    render(conn, :show, vendedor: vendedor)
  end

  def update(conn, %{"id" => id, "vendedor" => vendedor_params}) do
    vendedor = Vendedores.get_vendedor!(id)

    with {:ok, %Vendedor{} = vendedor} <- Vendedores.update_vendedor(vendedor, vendedor_params) do
      render(conn, :show, vendedor: vendedor)
    end
  end

  def delete(conn, %{"id" => id}) do
    vendedor = Vendedores.get_vendedor!(id)

    with {:ok, %Vendedor{}} <- Vendedores.delete_vendedor(vendedor) do
      send_resp(conn, :no_content, "")
    end
  end

  def get_saleForce_by_Age(conn, %{"age" => age}) do
    vendedores = Vendedores.get_saleForce_by_Age(age)
    render(conn, :index, vendedores: vendedores)
  end
end
