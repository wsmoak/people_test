defmodule PeopleTest.Repo.Migrations.CreateCouple do
  use Ecto.Migration

  def change do
    create table(:couples) do
      add :partner1_id, references(:people)
      add :partner2_id, references(:people)

      timestamps
    end
    create index(:couples, [:partner1_id])
    create index(:couples, [:partner2_id])

  end
end
