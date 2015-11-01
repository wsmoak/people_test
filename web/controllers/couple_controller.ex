defmodule PeopleTest.CoupleController do
  use PeopleTest.Web, :controller

  alias PeopleTest.Couple
  alias PeopleTest.Person

  plug :scrub_params, "couple" when action in [:create, :update]

  def index(conn, _params) do
    couples = Repo.all(Couple)
    render(conn, "index.html", couples: couples)
  end

  def new(conn, _params) do
    changeset = Couple.changeset(%Couple{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"couple" => couple_params}) do
    IO.write "In create, couple_params is:"
    IO.inspect couple_params

    person1 = Repo.get!(Person, couple_params["partner1_id"])
    IO.inspect person1

    person2 = Repo.get!(Person, couple_params["partner2_id"])
    IO.inspect person2

    changeset = Couple.changeset(%Couple{partner1: person1, partner2: person2})
    IO.inspect changeset

    case Repo.insert(changeset) do
      {:ok, _couple} ->
        conn
        |> put_flash(:info, "Couple created successfully.")
        |> redirect(to: couple_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    couple = Repo.get!(Couple, id)
    render(conn, "show.html", couple: couple)
  end

  def edit(conn, %{"id" => id}) do
    couple = Repo.get!(Couple, id)
    changeset = Couple.changeset(couple)
    render(conn, "edit.html", couple: couple, changeset: changeset)
  end

  def update(conn, %{"id" => id, "couple" => couple_params}) do
    couple = Repo.get!(Couple, id)
    changeset = Couple.changeset(couple, couple_params)

    case Repo.update(changeset) do
      {:ok, couple} ->
        conn
        |> put_flash(:info, "Couple updated successfully.")
        |> redirect(to: couple_path(conn, :show, couple))
      {:error, changeset} ->
        render(conn, "edit.html", couple: couple, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    couple = Repo.get!(Couple, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(couple)

    conn
    |> put_flash(:info, "Couple deleted successfully.")
    |> redirect(to: couple_path(conn, :index))
  end
end
