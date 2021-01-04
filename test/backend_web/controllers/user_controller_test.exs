defmodule BackendWeb.UserControllerTest do
  use Backend.DataCase, async: true

  alias Backend.Usuario
  alias BackendWeb.UserController

  describe "run/1" do
    test "returns a struct when the params are valid" do
      params = %{
        name: "nylo",
        cpf: "123456",
        street_address: "rua teste",
        number_address: "385",
        complement_address: "complemento",
        neighborhood_address: "centro",
        city: "vca",
        state: "BA",
        postal_code: "45000505"
      }

      assert {:ok, %Usuario{} = usuario} = UserController.run(params)
      assert usuario.name == "nylo"
      assert usuario.cpf == "123456"
      assert usuario.postal_code == "45000505"
    end

    test "returns error when name is missing" do
      params = %{
        name: "",
        cpf: "123411156",
        street_address: "rua teste",
        number_address: "385",
        complement_address: "complemento",
        neighborhood_address: "centro",
        city: "vca",
        state: "BA",
        postal_code: "45000505"
      }

      assert {:error, %Ecto.Changeset{} = changeset} = UserController.run(params)
      %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when cpf is missing" do
      params = %{
        name: "nylo",
        cpf: "",
        street_address: "rua teste",
        number_address: "385",
        complement_address: "complemento",
        neighborhood_address: "centro",
        city: "vca",
        state: "BA",
        postal_code: "45000505"
      }

      assert {:error, %Ecto.Changeset{} = changeset} = UserController.run(params)
      %{cpf: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when postal_code is missing" do
      params = %{
        name: "nylo",
        cpf: "123123",
        street_address: "rua teste",
        number_address: "385",
        complement_address: "complemento",
        neighborhood_address: "centro",
        city: "vca",
        state: "BA",
        postal_code: ""
      }

      assert {:error, %Ecto.Changeset{} = changeset} = UserController.run(params)
      %{postal_code: ["can't be blank"]} = errors_on(changeset)
    end
  end
end
