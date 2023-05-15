defmodule Ventas.VendedoresFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ventas.Vendedores` context.
  """

  @doc """
  Generate a vendedor.
  """
  def vendedor_fixture(attrs \\ %{}) do
    {:ok, vendedor} =
      attrs
      |> Enum.into(%{
        apellidos: "some apellidos",
        edad: 42,
        fecha_nac: ~D[2023-05-11],
        nombres: "some nombres",
        num_iden: "some num_iden"
      })
      |> Ventas.Vendedores.create_vendedor()

    vendedor
  end
end
