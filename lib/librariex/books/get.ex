defmodule Librariex.Books.Get do
  import Ecto.Query

  alias Ecto.UUID
  alias Librariex.{Book, Error, Repo}

  def call, do: {:ok, Repo.all(Book)}

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.invalid_id_format_error()}
      {:ok, uuid} -> get_book_by_id(uuid)
    end
  end

  defp get_book_by_id(id) do
    case Repo.get(Book, id) do
      nil -> {:error, Error.book_not_found_error()}
      book -> {:ok, book}
    end
  end

  def by_user_id(user_id) do
    case UUID.cast(user_id) do
      :error -> {:error, Error.invalid_id_format_error()}
      {:ok, uuid} -> get_book_by_user_id(uuid)
    end
  end

  defp get_book_by_user_id(user_id) do
    query = from book in Book, where: book.user_id == ^user_id

    {:ok, Repo.all(query)}
  end
end
