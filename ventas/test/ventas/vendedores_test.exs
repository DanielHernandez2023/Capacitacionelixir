defmodule Ventas.VendedoresTest do
  use Ventas.DataCase

  alias Ventas.Vendedores

  describe "vendedores" do
    alias Ventas.Vendedores.Vendedor

    import Ventas.VendedoresFixtures

    @invalid_attrs %{apellidos: nil, edad: nil, fecha_nac: nil, nombres: nil, num_iden: nil}

    test "list_vendedores/0 returns all vendedores" do
      vendedor = vendedor_fixture()
      assert Vendedores.list_vendedores() == [vendedor]
    end

    test "get_vendedor!/1 returns the vendedor with given id" do
      vendedor = vendedor_fixture()
      assert Vendedores.get_vendedor!(vendedor.id) == vendedor
    end

    test "create_vendedor/1 with valid data creates a vendedor" do
      valid_attrs = %{apellidos: "some apellidos", edad: 42, fecha_nac: ~D[2023-05-11], nombres: "some nombres", num_iden: "some num_iden"}

      assert {:ok, %Vendedor{} = vendedor} = Vendedores.create_vendedor(valid_attrs)
      assert vendedor.apellidos == "some apellidos"
      assert vendedor.edad == 42
      assert vendedor.fecha_nac == ~D[2023-05-11]
      assert vendedor.nombres == "some nombres"
      assert vendedor.num_iden == "some num_iden"
    end

    test "create_vendedor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vendedores.create_vendedor(@invalid_attrs)
    end

    test "update_vendedor/2 with valid data updates the vendedor" do
      vendedor = vendedor_fixture()
      update_attrs = %{apellidos: "some updated apellidos", edad: 43, fecha_nac: ~D[2023-05-12], nombres: "some updated nombres", num_iden: "some updated num_iden"}

      assert {:ok, %Vendedor{} = vendedor} = Vendedores.update_vendedor(vendedor, update_attrs)
      assert vendedor.apellidos == "some updated apellidos"
      assert vendedor.edad == 43
      assert vendedor.fecha_nac == ~D[2023-05-12]
      assert vendedor.nombres == "some updated nombres"
      assert vendedor.num_iden == "some updated num_iden"
    end

    test "update_vendedor/2 with invalid data returns error changeset" do
      vendedor = vendedor_fixture()
      assert {:error, %Ecto.Changeset{}} = Vendedores.update_vendedor(vendedor, @invalid_attrs)
      assert vendedor == Vendedores.get_vendedor!(vendedor.id)
    end

    test "delete_vendedor/1 deletes the vendedor" do
      vendedor = vendedor_fixture()
      assert {:ok, %Vendedor{}} = Vendedores.delete_vendedor(vendedor)
      assert_raise Ecto.NoResultsError, fn -> Vendedores.get_vendedor!(vendedor.id) end
    end

    test "change_vendedor/1 returns a vendedor changeset" do
      vendedor = vendedor_fixture()
      assert %Ecto.Changeset{} = Vendedores.change_vendedor(vendedor)
    end
  end
end
