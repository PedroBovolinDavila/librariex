defmodule LibrariexWeb.UsersView do
  use LibrariexWeb, :view

  alias Librariex.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user
    }
  end

  def render("delete.json", %{user: %User{} = user}) do
    %{
      message: "User deleted!",
      user: user
    }
  end

  def render("update.json", %{user: %User{} = user}) do
    %{
      message: "User updated!",
      user: user
    }
  end

  def render("users.json", %{users: users}), do: %{users: users}

  def render("show.json", %{user: %User{} = user}), do: %{user: user}
end
