defmodule Rumbl.Repo.Migrations.CreateVideos do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :url, :string
      add :title, :string
      add :description, :text
      add :user_id, references(:users)
      #videos_userid_id_fkey

      timestamps()
    end

    create index(:videos, [:user_id])
  end
end
