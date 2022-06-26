defmodule LibrariexWeb.BooksView do
  use LibrariexWeb, :view

  alias Librariex.Book

  def render("create.json", %{book: %Book{} = book}) do
    %{
      message: "Book created!",
      book: book
    }
  end

  def render("books.json", %{books: books}), do: %{books: books}
  def render("show.json", %{book: %Book{} = book}), do: %{book: book}
end
