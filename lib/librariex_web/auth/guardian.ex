defmodule LibrariexWeb.Auth.Guardian do
  use Guardian, otp_app: :librariex

  alias Librariex.{Error, User}

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(%{"sub" => id}), do: Librariex.get_user_by_id(id)

  def authenticate(%{"email" => email, "password" => password}) do
    with {:ok, %User{password_hash: hash} = user} <- Librariex.get_user_by_email(email),
         true <- Pbkdf2.verify_pass(password, hash),
         {:ok, token, _claims} <- encode_and_sign(user) do
      {:ok, token}
    else
      {:error, %Error{}} -> {:error, Error.build(:unauthorized, "Email or password incorrect!")}
      false -> {:error, Error.build(:unauthorized, "Email or password incorrect!")}
    end
  end
end
