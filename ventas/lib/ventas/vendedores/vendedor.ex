defmodule Ventas.Vendedores.Vendedor do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "vendedores" do
    field :apellidos, :string
    field :edad, :integer
    field :fecha_nac, :date
    field :nombres, :string
    field :num_iden, :string
    has_many :cliente, Ventas.Clientes.Cliente
    timestamps()
  end

  @doc false
  def changeset(vendedor, attrs) do
    vendedor
    |> cast(attrs, [:num_iden, :nombres, :apellidos, :fecha_nac, :edad])
    |> validate_required([:num_iden, :nombres, :apellidos, :fecha_nac, :edad])
  end
end
