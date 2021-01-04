defmodule BackendWeb.UserController do
  use BackendWeb, :controller

  def createUser(conn, params) do
    IO.inspect conn
    IO.puts "+++++"
    IO.inspect params

  end
end