import Config

# Configure your database
config :linkly, Linkly.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "linkly_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
