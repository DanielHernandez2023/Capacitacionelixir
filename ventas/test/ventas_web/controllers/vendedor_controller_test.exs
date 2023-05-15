defmodule VentasWeb.VendedorControllerTest do
  use VentasWeb.ConnCase

  import Ventas.VendedoresFixtures

  alias Ventas.Vendedores.Vendedor

  @create_attrs %{
    apellidos: "some apellidos",
    edad: 42,
    fecha_nac: ~D[2023-05-11],
    nombres: "some nombres",
    num_iden: "some num_iden"
  }
  @update_attrs %{
    apellidos: "some updated apellidos",
    edad: 43,
    fecha_nac: ~D[2023-05-12],
    nombres: "some updated nombres",
    num_iden: "some updated num_iden"
  }
  @invalid_attrs %{apellidos: nil, edad: nil, fecha_nac: nil, nombres: nil, num_iden: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all vendedores", %{conn: conn} do
      conn = get(conn, ~p"/api/vendedores")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create vendedor" do
    test "renders vendedor when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/vendedores", vendedor: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/vendedores/#{id}")

      assert %{
               "id" => ^id,
               "apellidos" => "some apellidos",
               "edad" => 42,
               "fecha_nac" => "2023-05-11",
               "nombres" => "some nombres",
               "num_iden" => "some num_iden"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/vendedores", vendedor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update vendedor" do
    setup [:create_vendedor]

    test "renders vendedor when data is valid", %{conn: conn, vendedor: %Vendedor{id: id} = vendedor} do
      conn = put(conn, ~p"/api/vendedores/#{vendedor}", vendedor: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/vendedores/#{id}")

      assert %{
               "id" => ^id,
               "apellidos" => "some updated apellidos",
               "edad" => 43,
               "fecha_nac" => "2023-05-12",
               "nombres" => "some updated nombres",
               "num_iden" => "some updated num_iden"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, vendedor: vendedor} do
      conn = put(conn, ~p"/api/vendedores/#{vendedor}", vendedor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete vendedor" do
    setup [:create_vendedor]

    test "deletes chosen vendedor", %{conn: conn, vendedor: vendedor} do
      conn = delete(conn, ~p"/api/vendedores/#{vendedor}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/vendedores/#{vendedor}")
      end
    end
  end

  defp create_vendedor(_) do
    vendedor = vendedor_fixture()
    %{vendedor: vendedor}
  end
end
