defmodule Librariex.Repo.Migrations.CreateBooksTable do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
      add :description, :string
      add :category, :string
      add :user_id, references(:users, type: :binary_id, on_delete: :delete_all)

      timestamps()
    end
  end
end
