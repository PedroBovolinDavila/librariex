defmodule Librariex.Users.Delete do
  alias Ecto.UUID
  alias Librariex.{Error, Repo, User}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.invalid_id_format_error()}
      {:ok, uuid} -> delete_user(uuid)
    end
  end

  defp delete_user(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.user_not_found_error()}
      user -> Repo.delete(user)
    end
  end
end
