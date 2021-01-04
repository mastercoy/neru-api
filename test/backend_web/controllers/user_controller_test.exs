defmodule BackendWeb.UserControllerTest do
  use BackendWeb.ConnCase

  alias Backend.Usuarios
  alias Backend.Usuarios.User

  @create_attrs %{
    city: "some city",
    complement_address: "some complement_address",
    cpf: "some cpf",
    name: "some name",
    neighborhood_address: "some neighborhood_address",
    number_address: "some number_address",
    postal_code: "some postal_code",
    state: "some state",
    street_address: "some street_address"
  }
  @update_attrs %{
    city: "some updated city",
    complement_address: "some updated complement_address",
    cpf: "some updated cpf",
    name: "some updated name",
    neighborhood_address: "some updated neighborhood_address",
    number_address: "some updated number_address",
    postal_code: "some updated postal_code",
    state: "some updated state",
    street_address: "some updated street_address"
  }
  @invalid_attrs %{
    city: nil,
    complement_address: nil,
    cpf: nil,
    name: nil,
    neighborhood_address: nil,
    number_address: nil,
    postal_code: nil,
    state: nil,
    street_address: nil
  }

  def fixture(:user) do
    {:ok, user} = Usuarios.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_path(conn, :show, id))

      assert %{
               "id" => id,
               "city" => "some city",
               "complement_address" => "some complement_address",
               "cpf" => "some cpf",
               "name" => "some name",
               "neighborhood_address" => "some neighborhood_address",
               "number_address" => "some number_address",
               "postal_code" => "some postal_code",
               "state" => "some state",
               "street_address" => "some street_address"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_path(conn, :show, id))

      assert %{
               "id" => id,
               "city" => "some updated city",
               "complement_address" => "some updated complement_address",
               "cpf" => "some updated cpf",
               "name" => "some updated name",
               "neighborhood_address" => "some updated neighborhood_address",
               "number_address" => "some updated number_address",
               "postal_code" => "some updated postal_code",
               "state" => "some updated state",
               "street_address" => "some updated street_address"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_path(conn, :show, user))
      end
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    %{user: user}
  end
end
