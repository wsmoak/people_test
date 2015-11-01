defmodule PeopleTest.Repo.Migrations.CreatePerson do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string
      add :age, :integer

      timestamps
    end

  end
end
