defmodule Rumbl.Multimedia.Video do
  use Ecto.Schema
  import Ecto.Changeset

  schema "videos" do
    field :desscription, :string
    field :title, :string
    field :url, :string

    belongs_to :user, Rumbl.Accounts.User #connects videos to User schema
    belongs_to :category, Rumbl.Multimedia.Category

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    #below shoujld be description but too lazy
    |> cast(attrs, [:url, :title, :desscription, :category_id]) #which fields from user-input may be allowed in
    |> validate_required([:url, :title, :desscription]) # validation of fields that MUST be present
    |> assoc_constraint(:category)
  end
end
