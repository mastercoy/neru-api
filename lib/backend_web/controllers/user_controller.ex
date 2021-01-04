defmodule BackendWeb.UserController do
  use BackendWeb, :controller
  import Ecto.Changeset

  alias Backend.{Repo, Usuario}

  def create(conn, params) do
    %Usuario{}
    |> cast(params, [
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
    |> validate_required([
      :name,
      :cpf,
      :postal_code
    ])
    |> Repo.insert()
  end

  # todo limpar
  # def createUser(conn, params) do
  # a = true

  # if a === true do
  # IO.inspect(conn)
  # IO.puts("+++++")
  # IO.inspect(params)
  # else
  # IO.puts("-----")
  # end
  # end
end
