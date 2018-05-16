defmodule Appointment.Accounts do
  use Appointment.Web, :model

  schema "user" do
    field :users, :string
    field :username, :string
    field :hashed_password, :string
    field :role, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:users, :username, :hashed_password, :role])
    |> validate_required([:users, :username, :hashed_password, :role])
    |> unique_constraint(:username)
  end
end
