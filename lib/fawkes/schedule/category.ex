defmodule Fawkes.Schedule.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias Fawkes.Repo
  alias Fawkes.Schedule.Category

  schema "categories" do
    field :icon_url, :string
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:slug, :name, :icon_url])
    |> validate_required([:slug, :name])
    |> unique_constraint(:slug)
  end

  def get(id) do
    Repo.get!(Category, id)
  end
end
