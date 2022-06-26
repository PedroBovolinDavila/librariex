defmodule Librariex.Book do
  use Ecto.Schema
  import Ecto.Changeset

  alias Librariex.User

  @required_params [:title, :author, :category, :description, :user_id]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "books" do
    field :title, :string
    field :author, :string
    field :description, :string
    field :category, :string

    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 6)
  end
end
