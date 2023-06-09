defmodule VentasWeb.ClienteControllerTest do
  use VentasWeb.ConnCase

  import Ventas.ClientesFixtures

  alias Ventas.Clientes.Cliente

  @create_attrs %{
    ciuadad: "some ciuadad",
    direccion: "some direccion",
    nombre: "some nombre"
  }
  @update_attrs %{
    ciuadad: "some updated ciuadad",
    direccion: "some updated direccion",
    nombre: "some updated nombre"
  }
  @invalid_attrs %{ciuadad: nil, direccion: nil, nombre: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all clientes", %{conn: conn} do
      conn = get(conn, ~p"/api/clientes")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cliente" do
    test "renders cliente when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/clientes", cliente: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/clientes/#{id}")

      assert %{
               "id" => ^id,
               "ciuadad" => "some ciuadad",
               "direccion" => "some direccion",
               "nombre" => "some nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/clientes", cliente: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cliente" do
    setup [:create_cliente]

    test "renders cliente when data is valid", %{conn: conn, cliente: %Cliente{id: id} = cliente} do
      conn = put(conn, ~p"/api/clientes/#{cliente}", cliente: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/clientes/#{id}")

      assert %{
               "id" => ^id,
               "ciuadad" => "some updated ciuadad",
               "direccion" => "some updated direccion",
               "nombre" => "some updated nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, cliente: cliente} do
      conn = put(conn, ~p"/api/clientes/#{cliente}", cliente: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cliente" do
    setup [:create_cliente]

    test "deletes chosen cliente", %{conn: conn, cliente: cliente} do
      conn = delete(conn, ~p"/api/clientes/#{cliente}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/clientes/#{cliente}")
      end
    end
  end

  defp create_cliente(_) do
    cliente = cliente_fixture()
    %{cliente: cliente}
  end
end
