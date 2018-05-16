defmodule Appointment.AccountsControllerTest do
  use Appointment.ConnCase

  alias Appointment.Accounts
  @valid_attrs %{hashed_password: "some content", role: "some content", username: "some content", users: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, accounts_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    accounts = Repo.insert! %Accounts{}
    conn = get conn, accounts_path(conn, :show, accounts)
    assert json_response(conn, 200)["data"] == %{"id" => accounts.id,
      "users" => accounts.users,
      "username" => accounts.username,
      "hashed_password" => accounts.hashed_password,
      "role" => accounts.role}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, accounts_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, accounts_path(conn, :create), accounts: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Accounts, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, accounts_path(conn, :create), accounts: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    accounts = Repo.insert! %Accounts{}
    conn = put conn, accounts_path(conn, :update, accounts), accounts: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Accounts, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    accounts = Repo.insert! %Accounts{}
    conn = put conn, accounts_path(conn, :update, accounts), accounts: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    accounts = Repo.insert! %Accounts{}
    conn = delete conn, accounts_path(conn, :delete, accounts)
    assert response(conn, 204)
    refute Repo.get(Accounts, accounts.id)
  end
end
