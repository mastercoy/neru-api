defmodule Backend.Usuarios.User do
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

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :city,
      :complement_address,
      :cpf,
      :name,
      :neighborhood_address,
      :number_address,
      :postal_code,
      :state,
      :street_address
    ])
    |> validate_required([
      :city,
      :complement_address,
      :cpf,
      :name,
      :neighborhood_address,
      :number_address,
      :postal_code,
      :state,
      :street_address
    ])
  end
end
