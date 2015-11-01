defmodule PeopleTest.Couple do
  use PeopleTest.Web, :model

  schema "couples" do
    belongs_to :partner1, PeopleTest.Partner1
    belongs_to :partner2, PeopleTest.Partner2

    timestamps
  end

  @required_fields ~w()
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
