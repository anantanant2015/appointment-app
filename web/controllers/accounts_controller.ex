defmodule Appointment.AccountsController do
  use Appointment.Web, :controller

  alias Appointment.Accounts

  def index(conn, _params) do
    user = Repo.all(Accounts)
    render(conn, "index.json", user: user)
  end

  def create(conn, %{"accounts" => accounts_params}) do
    changeset = Accounts.changeset(%Accounts{}, accounts_params)

    case Repo.insert(changeset) do
      {:ok, accounts} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", accounts_path(conn, :show, accounts))
        |> render("show.json", accounts: accounts)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Appointment.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    accounts = Repo.get!(Accounts, id)
    render(conn, "show.json", accounts: accounts)
  end

  def update(conn, %{"id" => id, "accounts" => accounts_params}) do
    accounts = Repo.get!(Accounts, id)
    changeset = Accounts.changeset(accounts, accounts_params)

    case Repo.update(changeset) do
      {:ok, accounts} ->
        render(conn, "show.json", accounts: accounts)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Appointment.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    accounts = Repo.get!(Accounts, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(accounts)

    send_resp(conn, :no_content, "")
  end
end
