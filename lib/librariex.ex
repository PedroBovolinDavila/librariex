defmodule Librariex do
  alias Librariex.Users.Create, as: CreateUser
  alias Librariex.Users.Delete, as: DeleteUser
  alias Librariex.Users.Get, as: GetUser
  alias Librariex.Users.Update, as: UpdateUser

  defdelegate create_user(params), to: CreateUser, as: :call
  defdelegate get_users(), to: GetUser, as: :call
  defdelegate get_user_by_id(id), to: GetUser, as: :by_id
  defdelegate delete_user(id), to: DeleteUser, as: :call
  defdelegate update_user(id), to: UpdateUser, as: :call
end
