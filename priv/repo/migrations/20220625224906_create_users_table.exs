defmodule Librariex.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password_hash, :string
      add :age, :integer
      add :address, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
