defmodule BackendWeb.UserView do
  use BackendWeb, :view
  alias BackendWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      city: user.city,
      complement_address: user.complement_address,
      cpf: user.cpf,
      name: user.name,
      neighborhood_address: user.neighborhood_address,
      number_address: user.number_address,
      postal_code: user.postal_code,
      state: user.state,
      street_address: user.street_address
    }
  end
end
