defmodule Linkly.User do
   use Ecto.Schema
  alias Linkly.{Bookmark, Link, LinkTag, Tag, User}

  @allowed_fields [:username, :about, :email, :birth_date]
  @required_fields [:username, :email, :birth_date]

  schema "users" do
    field(:about, :string)
    field(:birth_date, :date, virtual: true)
    field(:email, :string)
    field(:username, :string)
    has_many(:bookmarks, Bookmark)
    has_many(:bookmarked_links, through: [:bookmarks, :link])
    has_many(:taggings, LinkTag)
    many_to_many(:tagged_links, Link, join_through: LinkTag)
    many_to_many(:tags, Tag, join_through: LinkTag)

    timestamps()
  end
end
