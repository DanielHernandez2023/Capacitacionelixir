defmodule Ventas.Repo.Migrations.CreateClientes do
  use Ecto.Migration

  def change do
    create table(:clientes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :ciuadad, :string
      add :direccion, :string
      add :vendedor_id, references(:vendedores, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:clientes, [:vendedor_id])
  end
end
