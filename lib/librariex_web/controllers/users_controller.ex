defmodule LibrariexWeb.UsersController do
  use LibrariexWeb, :controller

  alias Librariex.User
  alias LibrariexWeb.Auth.Guardian
  alias LibrariexWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    with {:ok, users} <- Librariex.get_users() do
      conn
      |> put_status(:ok)
      |> render("users.json", users: users)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Librariex.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end

  def create(conn, params) do
    with {:ok, %User{} = user} <- Librariex.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Librariex.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Librariex.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", user: user)
    end
  end

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end
end
