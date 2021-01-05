defmodule Backend.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :street_address, :string
      add :cpf, :string, null: false
      add :number_address, :string
      add :complement_address, :string
      add :neighborhood_address, :string
      add :city, :string
      add :state, :string
      add :postal_code, :string, null: false

      timestamps()
    end

    create unique_index(:users, [:cpf])
  end
end

# {"data":{"city":null,"complement_address":null,"cpf":"123452311","id":22,"name":"teste","neighborhood_address":null,"number_address":null,"postal_code":"45000505","state":null,"street_address":null}}
