defmodule Rumbl.MultimediaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rumbl.Multimedia` context.
  """

  @doc """
  Generate a video.
  """
  def video_fixture(attrs \\ %{}) do
    {:ok, video} =
      attrs
      |> Enum.into(%{
         url: "some  url",
        desscription: "some desscription",
        title: "some title"
      })
      |> Rumbl.Multimedia.create_video()

    video
  end

  @doc """
  Generate a video.
  """
  def video_fixture(attrs \\ %{}) do
    {:ok, video} =
      attrs
      |> Enum.into(%{
        desscription: "some desscription",
        title: "some title",
        url: "some url"
      })
      |> Rumbl.Multimedia.create_video()

    video
  end
end
