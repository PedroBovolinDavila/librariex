defmodule Librariex.Users.Get do
  alias Ecto.UUID
  alias Librariex.{Error, Repo, User}

  def call, do: {:ok, Repo.all(User)}

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.invalid_id_format_error()}
      {:ok, uuid} -> get_user_by_id(uuid)
    end
  end

  defp get_user_by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
