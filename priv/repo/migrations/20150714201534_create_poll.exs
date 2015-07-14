defmodule QckpollSpike.Repo.Migrations.CreatePoll do
  use Ecto.Migration

  def change do
    create table(:polls) do
      add :title, :string
      add :author, :string

      timestamps
    end

  end
end
