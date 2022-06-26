defmodule Librariex.Users.Create do
  alias Librariex.{Error, Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{} = user}) do
    user = Repo.preload(user, :books)

    {:ok, user}
  end

  defp handle_insert({:error, changeset}), do: {:error, Error.build(:bad_request, changeset)}
end
