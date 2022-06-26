defmodule Librariex do
  alias Librariex.Users.Create, as: CreateUser
  alias Librariex.Users.Delete, as: DeleteUser
  alias Librariex.Users.Get, as: GetUser
  alias Librariex.Users.Update, as: UpdateUser

  alias Librariex.Books.Create, as: CreateBook
  alias Librariex.Books.Delete, as: DeleteBook
  alias Librariex.Books.Get, as: GetBook
  alias Librariex.Books.Update, as: UpdateBook

  defdelegate create_user(params), to: CreateUser, as: :call
  defdelegate get_users(), to: GetUser, as: :call
  defdelegate get_user_by_id(id), to: GetUser, as: :by_id
  defdelegate get_user_by_email(email), to: GetUser, as: :by_email
  defdelegate delete_user(id), to: DeleteUser, as: :call
  defdelegate update_user(params), to: UpdateUser, as: :call

  defdelegate create_book(params), to: CreateBook, as: :call
  defdelegate get_books(), to: GetBook, as: :call
  defdelegate get_book_by_id(id), to: GetBook, as: :by_id
  defdelegate get_books_by_user_id(user_id), to: GetBook, as: :by_user_id
  defdelegate delete_book(id), to: DeleteBook, as: :call
  defdelegate update_book(params), to: UpdateBook, as: :call
end
