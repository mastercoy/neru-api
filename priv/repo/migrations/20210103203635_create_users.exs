defmodule Backend.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :cpf, :string, null: false, unique: true
      add :street_address, :string
      add :number_address, :string
      add :complement_address, :string
      add :neighborhood_address, :string
      add :city, :string
      add :state, :string
      add :postal_code, :string, null: false

      timestamps()
    end
  end
end

