defmodule Ventas.Vendedores do
  @moduledoc """
  The Vendedores context.
  """

  import Ecto.Query, warn: false
  alias Ventas.Repo

  alias Ventas.Vendedores.Vendedor

  @doc """
  Returns the list of vendedores.

  ## Examples

      iex> list_vendedores()
      [%Vendedor{}, ...]

  """
  def list_vendedores do
    Repo.all(Vendedor) |> Repo.preload(:clientes)
  end

  @doc """
  Gets a single vendedor.

  Raises `Ecto.NoResultsError` if the Vendedor does not exist.

  ## Examples

      iex> get_vendedor!(123)
      %Vendedor{}

      iex> get_vendedor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vendedor!(id), do: Repo.get!(Vendedor, id)

  @doc """
  Creates a vendedor.

  ## Examples

      iex> create_vendedor(%{field: value})
      {:ok, %Vendedor{}}

      iex> create_vendedor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vendedor(attrs \\ %{}) do
    %Vendedor{}
    |> Vendedor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vendedor.

  ## Examples

      iex> update_vendedor(vendedor, %{field: new_value})
      {:ok, %Vendedor{}}

      iex> update_vendedor(vendedor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vendedor(%Vendedor{} = vendedor, attrs) do
    vendedor
    |> Vendedor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vendedor.

  ## Examples

      iex> delete_vendedor(vendedor)
      {:ok, %Vendedor{}}

      iex> delete_vendedor(vendedor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vendedor(%Vendedor{} = vendedor) do
    Repo.delete(vendedor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vendedor changes.

  ## Examples

      iex> change_vendedor(vendedor)
      %Ecto.Changeset{data: %Vendedor{}}

  """
  def change_vendedor(%Vendedor{} = vendedor, attrs \\ %{}) do
    Vendedor.changeset(vendedor, attrs)
  end
end
