defmodule FirstApp.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :birth, :date
      add :age, :integer

      timestamps()
    end

  end
end
