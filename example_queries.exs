# import Ecto.Query
# import Ecto.Changeset
# alias Ecto.Adapters.SQL
alias Linkly.Repo
alias Linkly.{User}

datetime_now = DateTime.utc_now()

links_to_insert =
  [
    [
      url: "https://www.google.com/",
      inserted_at: datetime_now,
      updated_at: datetime_now
    ],
    [
      url: "https://www.youtube.com/",
      inserted_at: datetime_now,
      updated_at: datetime_now
    ],
    [
      url: "https://news.ycombinator.com/",
      inserted_at: datetime_now,
      updated_at: datetime_now
    ],
    [
      url: "https://lobste.rs/",
      inserted_at: datetime_now,
      updated_at: datetime_now
    ],
    [
      url: "https://elixir-lang.org/",
      inserted_at: datetime_now,
      updated_at: datetime_now
    ],
    [
      url: "https://github.com/",
      inserted_at: datetime_now,
      updated_at: datetime_now
    ],
    [
      url: "https://gitgud.io/",
      inserted_at: datetime_now,
      updated_at: datetime_now
    ],
    [
      url: "https://changelog.com/gotime",
      inserted_at: datetime_now,
      updated_at: datetime_now
    ]
  ]

users_to_insert =
  [
    [
      username: "alice",
      email: "alice@example.com",
      inserted_at: datetime_now,
      updated_at: datetime_now
    ],
    [
      username: "bob",
      email: "bob@example.com",
      inserted_at: datetime_now,
      updated_at: datetime_now
    ],
    [
      username: "ben",
      email: "ben@example.com",
      inserted_at: datetime_now,
      updated_at: datetime_now
    ],
    [
      username: "sandra",
      email: "sandra@example.com",
      inserted_at: datetime_now,
      updated_at: datetime_now
    ]
  ]

bookmarks_to_insert = [
  [
    title: "Search Engine",
    user_id: 1,
    link_id: 1,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    title: "Elixir Homepage",
    user_id: 1,
    link_id: 5,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    title: "Elixir :: Main",
    user_id: 3,
    link_id: 5,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    title: "Code Hosting Site",
    user_id: 2,
    link_id: 7,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    title: "Gitlab Instance",
    user_id: 3,
    link_id: 7,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    title: "Github",
    user_id: 2,
    link_id: 6,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    title: "Tech News",
    user_id: 4,
    link_id: 4,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    title: "Startup News",
    user_id: 4,
    link_id: 3,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    title: "GoTime Podcast on Changelog",
    user_id: 4,
    link_id: 8,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    title: "Changelog - GoTime",
    user_id: 1,
    link_id: 8,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ]
]

tags_to_insert = [
  [title: "Resources", inserted_at: datetime_now, updated_at: datetime_now],
  [title: "Elixir", inserted_at: datetime_now, updated_at: datetime_now],
  [title: "Community", inserted_at: datetime_now, updated_at: datetime_now],
  [title: "Business", inserted_at: datetime_now, updated_at: datetime_now],
  [title: "Podcast", inserted_at: datetime_now, updated_at: datetime_now],
  [title: "Tech", inserted_at: datetime_now, updated_at: datetime_now]
]

link_tags_to_insert = [
  [
    user_id: 1,
    link_id: 5,
    tag_id: 1,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    user_id: 1,
    link_id: 5,
    tag_id: 2,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    user_id: 3,
    link_id: 5,
    tag_id: 2,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    user_id: 2,
    link_id: 7,
    tag_id: 6,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    user_id: 3,
    link_id: 7,
    tag_id: 3,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    user_id: 3,
    link_id: 7,
    tag_id: 4,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    user_id: 3,
    link_id: 7,
    tag_id: 6,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    user_id: 2,
    link_id: 6,
    tag_id: 6,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    user_id: 4,
    link_id: 3,
    tag_id: 3,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    user_id: 4,
    link_id: 3,
    tag_id: 6,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    user_id: 4,
    link_id: 4,
    tag_id: 3,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    user_id: 4,
    link_id: 4,
    tag_id: 4,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    user_id: 4,
    link_id: 8,
    tag_id: 5,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ],
  [
    user_id: 4,
    link_id: 8,
    tag_id: 6,
    inserted_at: datetime_now,
    updated_at: datetime_now
  ]
]

Repo.insert_all("users", users_to_insert, returning: [:id, :username])
Repo.insert_all("links", links_to_insert, returning: [:id, :url])
Repo.insert_all("bookmarks", bookmarks_to_insert)
Repo.insert_all("tags", tags_to_insert)
Repo.insert_all("link_tags", link_tags_to_insert)

queried = Repo.get(User, 4) |> Repo.preload(bookmarked_links: [:tags])
IO.inspect(queried)
