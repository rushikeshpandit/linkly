defmodule Linkly.User do
  use Ecto.Schema
  import Ecto.Changeset
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

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, @allowed_fields)
    |> validate_required(@required_fields)
    |> validate_length(:username, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_change(:birth_date, &older_than_13/2)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end

  def older_than_13(:birth_date, %Date{} = birth_date) do
    {this_year, this_month, this_day} = Date.to_erl(Date.utc_today())
    min_date = Date.from_erl!({this_year - 13, this_month, this_day})

    case Date.compare(min_date, birth_date) do
      :lt -> [birth_date: "Must be over 13 years old!"]
      _ -> []
    end
  end

  # defstruct [:about, :email, :username, :id, :inserted_at, :updated_at]
end
