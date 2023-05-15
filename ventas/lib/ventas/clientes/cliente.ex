defmodule Ventas.Clientes.Cliente do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "clientes" do
    field :ciuadad, :string
    field :direccion, :string
    field :nombre, :string
    belongs_to :vendedor, Ventas.Vendedores.Vendedor
    timestamps()
  end

  @doc false
  def changeset(cliente, attrs) do
    cliente
    |> cast(attrs, [:nombre, :ciuadad, :direccion])
    |> validate_required([:nombre, :ciuadad, :direccion])
  end
end
