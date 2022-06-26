defmodule Librariex.Books.Update do
  alias Ecto.UUID
  alias Librariex.{Book, Error, Repo}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, Error.invalid_id_format_error()}
      {:ok, uuid} -> update_book(uuid, params)
    end
  end

  defp update_book(id, params) do
    case Repo.get(Book, id) do
      nil -> {:error, Error.book_not_found_error()}
      book -> do_update(book, params)
    end
  end

  defp do_update(book, params) do
    book
    |> Book.changeset(params)
    |> Repo.update()
  end
end
