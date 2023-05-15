defmodule VentasWeb.VendedorJSON do
  alias Ventas.Vendedores.Vendedor

  @doc """
  Renders a list of vendedores.
  """
  def index(%{vendedores: vendedores}) do
    %{data: for(vendedor <- vendedores, do: data(vendedor))}
  end

  @doc """
  Renders a single vendedor.
  """
  def show(%{vendedor: vendedor}) do
    %{data: data(vendedor)}
  end

  defp data(%Vendedor{} = vendedor) do
    %{
      id: vendedor.id,
      num_iden: vendedor.num_iden,
      nombres: vendedor.nombres,
      apellidos: vendedor.apellidos,
      fecha_nac: vendedor.fecha_nac,
      edad: vendedor.edad
    }
  end
end
