defmodule Librariex.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset

  @create_params [:name, :email, :password, :age, :address]
  @update_params [:name, :email, :age, :address]

  @primary_key {:id, :binary_id, autogenerate: true}

  @derive {Jason.Encoder, only: @update_params ++ [:id]}

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :age, :integer
    field :address, :string

    timestamps()
  end

  def changeset(params), do: changes(%__MODULE__{}, params, @create_params)

  def changeset(struct, params), do: changes(struct, params, @update_params)

  defp changes(struct, params, fields) do
    struct
    |> cast(params, fields)
    |> validate_required(fields)
    |> validate_length(:password, min: 6)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
