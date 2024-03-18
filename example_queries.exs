import Ecto.Query
alias Ecto.Adapters.SQL
alias Linkly.Repo
alias Linkly.User

links_to_insert =
  [
    [
      url: "https://alchemist.com",
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      url: "https://reactor.am",
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      url: "https://indiehackers.com",
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ]
  ]

users_to_insert =
  [
    [
      username: "alice",
      email: "alice@example.com",
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      username: "bob",
      email: "bob@example.com",
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      username: "linda",
      email: "linda@example.com",
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ]
  ]

bookmarks_to_insert =
  [
    [
      title: "A site with lots of Elixir tutorials",
      user_id: 1,
      link_id: 1,
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      title: "Alchemist Camp",
      user_id: 2,
      link_id: 1,
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      title: "Reactor Podcast",
      user_id: 2,
      link_id: 2,
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      title: "IH",
      user_id: 1,
      link_id: 3,
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ]
  ]

tags_to_insert =
  [
    [
      title: "Business",
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      title: "Coding",
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      title: "Elixir",
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      title: "Podcast",
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      title: "Projects",
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      title: "Resource",
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ]
  ]

# three way join table
link_tags_to_insert =
  [
    [
      link_id: 1,
      user_id: 1,
      tag_id: 3,
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      link_id: 2,
      user_id: 2,
      tag_id: 1,
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      link_id: 2,
      user_id: 2,
      tag_id: 4,
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      link_id: 1,
      user_id: 3,
      tag_id: 5,
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ],
    [
      link_id: 2,
      user_id: 3,
      tag_id: 3,
      inserted_at: DateTime.utc_now(),
      updated_at: DateTime.utc_now()
    ]
  ]

Repo.insert_all("users", users_to_insert, returning: [:id, :username])
Repo.insert_all("links", links_to_insert, returning: [:id, :url])
Repo.insert_all("bookmarks", bookmarks_to_insert)
Repo.insert_all("tags", tags_to_insert)
Repo.insert_all("link_tags", link_tags_to_insert)

third_user = %User{
  username: "sam",
  email: "sam@example.com",
  about: "I like to laugh."
}

Repo.insert(%User{username: "sam", email: "sam@example.com", about: "I like to laugh."})

sam_query = from(User, where: [username: "sam"])
Repo.update_all(sam_query, set: [email: "sam@gmail.com"])
