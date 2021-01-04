defmodule BackendWeb.UserController do
  use BackendWeb, :controller

  def createUser(conn, params) do
    a = true

    if a === true do
      IO.inspect(conn)
      IO.puts("+++++")
      IO.inspect(params)
    else
      IO.puts("-----")
    end
  end
end
