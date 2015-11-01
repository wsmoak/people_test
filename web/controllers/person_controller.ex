defmodule PeopleTest.PersonController do
  use PeopleTest.Web, :controller

  alias PeopleTest.Person

  plug :scrub_params, "person" when action in [:create, :update]

  def index(conn, _params) do
    people = Repo.all(Person)
    render(conn, "index.html", people: people)
  end

  def new(conn, _params) do
    changeset = Person.changeset(%Person{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"person" => person_params}) do
    changeset = Person.changeset(%Person{}, person_params)

    case Repo.insert(changeset) do
      {:ok, _person} ->
        conn
        |> put_flash(:info, "Person created successfully.")
        |> redirect(to: person_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    person = Repo.get!(Person, id)
    render(conn, "show.html", person: person)
  end

  def edit(conn, %{"id" => id}) do
    person = Repo.get!(Person, id)
    changeset = Person.changeset(person)
    render(conn, "edit.html", person: person, changeset: changeset)
  end

  def update(conn, %{"id" => id, "person" => person_params}) do
    person = Repo.get!(Person, id)
    changeset = Person.changeset(person, person_params)

    case Repo.update(changeset) do
      {:ok, person} ->
        conn
        |> put_flash(:info, "Person updated successfully.")
        |> redirect(to: person_path(conn, :show, person))
      {:error, changeset} ->
        render(conn, "edit.html", person: person, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    person = Repo.get!(Person, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(person)

    conn
    |> put_flash(:info, "Person deleted successfully.")
    |> redirect(to: person_path(conn, :index))
  end
end
