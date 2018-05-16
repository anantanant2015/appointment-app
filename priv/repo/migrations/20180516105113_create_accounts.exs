defmodule Appointment.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :users, :string
      add :username, :string
      add :hashed_password, :string
      add :role, :string

      timestamps()
    end
    create unique_index(:user, [:username])

  end
end
