defmodule BackendWeb.UserController do
  use BackendWeb, :controller

  alias Backend.Usuarios
  alias Backend.Usuarios.User

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    users = Usuarios.list_users()
    render(conn, "index.json", users: users)
  end

#  def create(conn, params), do: throw params["user"]["postal_code"]
  def create(conn, %{"user" => user_params}) do
    {:ok, address} = Cep.Client.get_address(user_params["postal_code"])
    IO.inspect address
    with {:ok, %User{} = user} <- Usuarios.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Usuarios.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Usuarios.get_user!(id)

    with {:ok, %User{} = user} <- Usuarios.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Usuarios.get_user!(id)

    with {:ok, %User{}} <- Usuarios.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
