defmodule Qckpoll.Repo.Migrations.CreatePoll do
  use Ecto.Migration

  def change do
    create table(:poll) do
      add :title, :string
      add :user_id, :integer

      timestamps
    end
    create index(:poll, [:user_id])

  end
end
