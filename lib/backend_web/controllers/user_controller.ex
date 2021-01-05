defmodule BackendWeb.UserController do
  use BackendWeb, :controller

  alias Backend.Usuarios
  alias Backend.Usuarios.User

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    users = Usuarios.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    {status, address} = Cep.Client.get_address(user_params["postal_code"])

    user_params = if status == :ok do
      user_params = Map.put(user_params, "city", address.city)
      user_params = Map.put(user_params, "state", address.state)
      user_params = Map.put(user_params, "postal_code", address.cep)
      user_params = Map.put(user_params, "neighborhood_address", address.neighborhood)
      user_params = Map.put(user_params, "street_address", address.street)
    else
      user_params
    end


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
