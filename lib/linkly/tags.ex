defmodule Linkly.Tag do
  use Ecto.Schema
  alias Linkly.{Link, User, LinkTag, Tag}

  schema "tags" do
    field(:title, :string)
    has_many(:taggings, LinkTag)
    many_to_many(:users, User, join_through: LinkTag)
    many_to_many(:links, Link, join_through: LinkTag)

    timestamps()
  end
end
