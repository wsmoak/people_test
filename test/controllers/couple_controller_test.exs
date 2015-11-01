defmodule PeopleTest.CoupleControllerTest do
  use PeopleTest.ConnCase

  alias PeopleTest.Couple
  @valid_attrs %{}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, couple_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing couples"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, couple_path(conn, :new)
    assert html_response(conn, 200) =~ "New couple"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, couple_path(conn, :create), couple: @valid_attrs
    assert redirected_to(conn) == couple_path(conn, :index)
    assert Repo.get_by(Couple, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, couple_path(conn, :create), couple: @invalid_attrs
    assert html_response(conn, 200) =~ "New couple"
  end

  test "shows chosen resource", %{conn: conn} do
    couple = Repo.insert! %Couple{}
    conn = get conn, couple_path(conn, :show, couple)
    assert html_response(conn, 200) =~ "Show couple"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, couple_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    couple = Repo.insert! %Couple{}
    conn = get conn, couple_path(conn, :edit, couple)
    assert html_response(conn, 200) =~ "Edit couple"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    couple = Repo.insert! %Couple{}
    conn = put conn, couple_path(conn, :update, couple), couple: @valid_attrs
    assert redirected_to(conn) == couple_path(conn, :show, couple)
    assert Repo.get_by(Couple, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    couple = Repo.insert! %Couple{}
    conn = put conn, couple_path(conn, :update, couple), couple: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit couple"
  end

  test "deletes chosen resource", %{conn: conn} do
    couple = Repo.insert! %Couple{}
    conn = delete conn, couple_path(conn, :delete, couple)
    assert redirected_to(conn) == couple_path(conn, :index)
    refute Repo.get(Couple, couple.id)
  end
end
