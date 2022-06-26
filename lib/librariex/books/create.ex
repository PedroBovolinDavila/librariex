defmodule Librariex.Books.Create do
  alias Ecto.UUID
  alias Librariex.{Book, Error, Repo}

  def call(%{"user_id" => user_id} = params) do
    case UUID.cast(user_id) do
      :error -> {:error, Error.invalid_id_format_error()}
      {:ok, _uuid} -> create_book(params)
    end
  end

  defp create_book(params) do
    params
    |> Book.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Book{}} = result), do: result
  defp handle_insert({:error, changeset}), do: {:error, Error.build(:bad_request, changeset)}
end
