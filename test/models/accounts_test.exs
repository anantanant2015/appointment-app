defmodule Appointment.AccountsTest do
  use Appointment.ModelCase

  alias Appointment.Accounts

  @valid_attrs %{hashed_password: "some content", role: "some content", username: "some content", users: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Accounts.changeset(%Accounts{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Accounts.changeset(%Accounts{}, @invalid_attrs)
    refute changeset.valid?
  end
end
