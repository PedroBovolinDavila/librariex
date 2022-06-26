defmodule LibrariexWeb.BooksController do
  use LibrariexWeb, :controller

  alias Librariex.Book
  alias LibrariexWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    with {:ok, books} <- Librariex.get_books() do
      conn
      |> put_status(:ok)
      |> render("books.json", books: books)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Book{} = book} <- Librariex.get_book_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", book: book)
    end
  end

  def show_by_user_id(conn, %{"id" => id}) do
    with {:ok, books} <- Librariex.get_books_by_user_id(id) do
      conn
      |> put_status(:ok)
      |> render("books.json", books: books)
    end
  end

  def create(conn, params) do
    with {:ok, %Book{} = book} <- Librariex.create_book(params) do
      conn
      |> put_status(:created)
      |> render("create.json", book: book)
    end
  end
end
