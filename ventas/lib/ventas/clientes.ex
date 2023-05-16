defmodule Ventas.Clientes do
  @moduledoc """
  The Clientes context.
  """

  import Ecto.Query, warn: false
  alias Ventas.Repo

  alias Ventas.Clientes.Cliente

  @doc """
  Returns the list of clientes.

  ## Examples

      iex> list_clientes()
      [%Cliente{}, ...]

  """
  def list_clientes do
    Repo.all(Cliente) |> Repo.preload(:vendedor)
  end

  @doc """
  Gets a single cliente.

  Raises `Ecto.NoResultsError` if the Cliente does not exist.

  ## Examples

      iex> get_cliente!(123)
      %Cliente{}

      iex> get_cliente!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cliente!(id), do: Repo.get!(Cliente, id) |> Repo.preload(:vendedor)

  @doc """
  Creates a cliente.

  ## Examples

      iex> create_cliente(%{field: value})
      {:ok, %Cliente{}}

      iex> create_cliente(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cliente(attrs \\ %{}) do
    %Cliente{}
    |> Repo.preload(:vendedor)
    |> Cliente.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cliente.

  ## Examples

      iex> update_cliente(cliente, %{field: new_value})
      {:ok, %Cliente{}}

      iex> update_cliente(cliente, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cliente(%Cliente{} = cliente, attrs) do
    cliente
    |> Cliente.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cliente.

  ## Examples

      iex> delete_cliente(cliente)
      {:ok, %Cliente{}}

      iex> delete_cliente(cliente)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cliente(%Cliente{} = cliente) do
    Repo.delete(cliente)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cliente changes.

  ## Examples

      iex> change_cliente(cliente)
      %Ecto.Changeset{data: %Cliente{}}

  """
  def change_cliente(%Cliente{} = cliente, attrs \\ %{}) do
    Cliente.changeset(cliente, attrs)
  end

  def get_cliente_x_nombre(nombre_cliente) do
     Repo.all(from cte in Cliente, where: cte.nombre == ^nombre_cliente) |> Repo.preload(:vendedor)
  end

end
