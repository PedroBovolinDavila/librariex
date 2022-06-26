defmodule Librariex.Users.Update do
  alias Ecto.UUID
  alias Librariex.{Error, Repo, User}

  def call(params = %{"id" => id}) do
    case UUID.cast(id) do
      :error -> {:error, Error.invalid_id_format_error()}
      {:ok, uuid} -> update_user(uuid, params)
    end
  end

  defp update_user(id, params) do
    case Repo.get(User, id) do
      nil -> {:error, Error.user_not_found_error()}
      user -> do_update(user, params)
    end
  end

  defp do_update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %User{} = user}), do: {:ok, Repo.preload(user, :books)}
  defp handle_update({:error, changeset}), do: {:error, Error.build(:bad_request, changeset)}
end
