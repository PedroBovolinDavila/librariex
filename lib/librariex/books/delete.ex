defmodule Librariex.Books.Delete do
  alias Ecto.UUID
  alias Librariex.{Book, Error, Repo}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.invalid_id_format_error()}
      {:ok, uuid} -> delete_book(uuid)
    end
  end

  defp delete_book(id) do
    case Repo.get(Book, id) do
      nil -> {:error, Error.book_not_found_error()}
      book -> Repo.delete(book)
    end
  end
end
