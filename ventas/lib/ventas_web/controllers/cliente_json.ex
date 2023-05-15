defmodule VentasWeb.ClienteJSON do
  alias Ventas.Clientes.Cliente

  @doc """
  Renders a list of clientes.
  """
  def index(%{clientes: clientes}) do
    %{data: for(cliente <- clientes, do: data(cliente))}
  end

  @doc """
  Renders a single cliente.
  """
  def show(%{cliente: cliente}) do
    %{data: data(cliente)}
  end

  defp data(%Cliente{} = cliente) do
    %{
      id: cliente.id,
      nombre: cliente.nombre,
      ciuadad: cliente.ciuadad,
      direccion: cliente.direccion
    }
  end
end
