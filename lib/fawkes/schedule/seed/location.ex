defmodule Fawkes.Schedule.Seed.Location do
  @moduledoc false

  alias Fawkes.Repo
  alias Fawkes.Schedule.Location

  def perform do
    Enum.each(data(), fn attrs ->
      %Location{}
      |> Location.changeset(attrs)
      |> Repo.insert!()
    end)
  end

  def data do
    [
      %{
        slug: "grand_ballroom",
        name: "Grand Ballroom"
      },
      %{
        slug: "evergreen_ab",
        name: "Evergreen AB"
      },
      %{
        slug: "evergreen_e",
        name: "Evergreen E"
      }
    ]
  end
end
