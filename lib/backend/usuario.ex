defmodule Backend.Usuario do
  @moduledoc """
  User schema
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :city, :string
    field :complement_address, :string
    field :cpf, :string
    field :name, :string
    field :neighborhood_address, :string
    field :number_address, :string
    field :postal_code, :string
    field :state, :string
    field :street_address, :string

    timestamps()
  end

  def changeset(usuario, attrs) do
    usuario
    |> cast(
      attrs,
      [
        :name,
        :cpf,
        :street_address,
        :number_address,
        :complement_address,
        :neighborhood_address,
        :city,
        :state,
        :postal_code
      ]
    )
    |> validate_required([
      :name,
      :cpf,
      :street_address,
      :number_address,
      :complement_address,
      :neighborhood_address,
      :city,
      :state,
      :postal_code
    ])
  end
end
