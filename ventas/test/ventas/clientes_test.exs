defmodule Ventas.ClientesTest do
  use Ventas.DataCase

  alias Ventas.Clientes

  describe "clientes" do
    alias Ventas.Clientes.Cliente

    import Ventas.ClientesFixtures

    @invalid_attrs %{ciuadad: nil, direccion: nil, nombre: nil}

    test "list_clientes/0 returns all clientes" do
      cliente = cliente_fixture()
      assert Clientes.list_clientes() == [cliente]
    end

    test "get_cliente!/1 returns the cliente with given id" do
      cliente = cliente_fixture()
      assert Clientes.get_cliente!(cliente.id) == cliente
    end

    test "create_cliente/1 with valid data creates a cliente" do
      valid_attrs = %{ciuadad: "some ciuadad", direccion: "some direccion", nombre: "some nombre"}

      assert {:ok, %Cliente{} = cliente} = Clientes.create_cliente(valid_attrs)
      assert cliente.ciuadad == "some ciuadad"
      assert cliente.direccion == "some direccion"
      assert cliente.nombre == "some nombre"
    end

    test "create_cliente/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clientes.create_cliente(@invalid_attrs)
    end

    test "update_cliente/2 with valid data updates the cliente" do
      cliente = cliente_fixture()
      update_attrs = %{ciuadad: "some updated ciuadad", direccion: "some updated direccion", nombre: "some updated nombre"}

      assert {:ok, %Cliente{} = cliente} = Clientes.update_cliente(cliente, update_attrs)
      assert cliente.ciuadad == "some updated ciuadad"
      assert cliente.direccion == "some updated direccion"
      assert cliente.nombre == "some updated nombre"
    end

    test "update_cliente/2 with invalid data returns error changeset" do
      cliente = cliente_fixture()
      assert {:error, %Ecto.Changeset{}} = Clientes.update_cliente(cliente, @invalid_attrs)
      assert cliente == Clientes.get_cliente!(cliente.id)
    end

    test "delete_cliente/1 deletes the cliente" do
      cliente = cliente_fixture()
      assert {:ok, %Cliente{}} = Clientes.delete_cliente(cliente)
      assert_raise Ecto.NoResultsError, fn -> Clientes.get_cliente!(cliente.id) end
    end

    test "change_cliente/1 returns a cliente changeset" do
      cliente = cliente_fixture()
      assert %Ecto.Changeset{} = Clientes.change_cliente(cliente)
    end
  end
end
