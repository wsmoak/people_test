defmodule PeopleTest.CoupleTest do
  use PeopleTest.ModelCase

  alias PeopleTest.Couple

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Couple.changeset(%Couple{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Couple.changeset(%Couple{}, @invalid_attrs)
    refute changeset.valid?
  end
end
