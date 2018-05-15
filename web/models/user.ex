defmodule Appointment.User do
    use Appointment.Web, :model

    schema "users" do
        field :name, :string
        field :email, :string
        field :password, :string, virtual: true
        field :password_hash, :string
        field :role, :string

        timestamps()
    end

    def changeset(model, params \\ :empty) do
        model
        |> cast(params, ~w(name email password role))
        |> validate_length(:name, min: 1, max: 20)
        |> validate_required(:email)
    end
end