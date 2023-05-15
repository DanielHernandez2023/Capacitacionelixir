defmodule Ventas.ClientesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ventas.Clientes` context.
  """

  @doc """
  Generate a cliente.
  """
  def cliente_fixture(attrs \\ %{}) do
    {:ok, cliente} =
      attrs
      |> Enum.into(%{
        ciuadad: "some ciuadad",
        direccion: "some direccion",
        nombre: "some nombre"
      })
      |> Ventas.Clientes.create_cliente()

    cliente
  end
end
