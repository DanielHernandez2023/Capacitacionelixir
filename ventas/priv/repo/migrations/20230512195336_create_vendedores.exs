defmodule Ventas.Repo.Migrations.CreateVendedores do
  use Ecto.Migration

  def change do
    create table(:vendedores, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :num_iden, :string
      add :nombres, :string
      add :apellidos, :string
      add :fecha_nac, :date
      add :edad, :integer

      timestamps()
    end
    create unique_index(:vendedores, [:num_iden])
  end
end
