defmodule Backend.UsuariosTest do
  use Backend.DataCase

  alias Backend.Usuarios

  describe "users" do
    alias Backend.Usuarios.User

    @valid_attrs %{
      city: "some city",
      code: "some code",
      complement_address: "some complement_address",
      cpf: "some cpf",
      name: "some name",
      neighborhood_address: "some neighborhood_address",
      number_address: "some number_address",
      postal: "some postal",
      state: "some state",
      street_address: "some street_address"
    }
    @update_attrs %{
      city: "some updated city",
      code: "some updated code",
      complement_address: "some updated complement_address",
      cpf: "some updated cpf",
      name: "some updated name",
      neighborhood_address: "some updated neighborhood_address",
      number_address: "some updated number_address",
      postal: "some updated postal",
      state: "some updated state",
      street_address: "some updated street_address"
    }
    @invalid_attrs %{
      city: nil,
      code: nil,
      complement_address: nil,
      cpf: nil,
      name: nil,
      neighborhood_address: nil,
      number_address: nil,
      postal: nil,
      state: nil,
      street_address: nil
    }

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Usuarios.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Usuarios.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Usuarios.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Usuarios.create_user(@valid_attrs)
      assert user.city == "some city"
      assert user.code == "some code"
      assert user.complement_address == "some complement_address"
      assert user.cpf == "some cpf"
      assert user.name == "some name"
      assert user.neighborhood_address == "some neighborhood_address"
      assert user.number_address == "some number_address"
      assert user.postal == "some postal"
      assert user.state == "some state"
      assert user.street_address == "some street_address"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usuarios.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Usuarios.update_user(user, @update_attrs)
      assert user.city == "some updated city"
      assert user.code == "some updated code"
      assert user.complement_address == "some updated complement_address"
      assert user.cpf == "some updated cpf"
      assert user.name == "some updated name"
      assert user.neighborhood_address == "some updated neighborhood_address"
      assert user.number_address == "some updated number_address"
      assert user.postal == "some updated postal"
      assert user.state == "some updated state"
      assert user.street_address == "some updated street_address"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Usuarios.update_user(user, @invalid_attrs)
      assert user == Usuarios.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Usuarios.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Usuarios.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Usuarios.change_user(user)
    end
  end

  describe "users" do
    alias Backend.Usuarios.User

    @valid_attrs %{
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

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Usuarios.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Usuarios.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Usuarios.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Usuarios.create_user(@valid_attrs)
      assert user.city == "some city"
      assert user.complement_address == "some complement_address"
      assert user.cpf == "some cpf"
      assert user.name == "some name"
      assert user.neighborhood_address == "some neighborhood_address"
      assert user.number_address == "some number_address"
      assert user.postal_code == "some postal_code"
      assert user.state == "some state"
      assert user.street_address == "some street_address"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usuarios.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Usuarios.update_user(user, @update_attrs)
      assert user.city == "some updated city"
      assert user.complement_address == "some updated complement_address"
      assert user.cpf == "some updated cpf"
      assert user.name == "some updated name"
      assert user.neighborhood_address == "some updated neighborhood_address"
      assert user.number_address == "some updated number_address"
      assert user.postal_code == "some updated postal_code"
      assert user.state == "some updated state"
      assert user.street_address == "some updated street_address"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Usuarios.update_user(user, @invalid_attrs)
      assert user == Usuarios.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Usuarios.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Usuarios.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Usuarios.change_user(user)
    end
  end
end
