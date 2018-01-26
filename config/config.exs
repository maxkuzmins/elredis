# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :elredis, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:elredis, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
config :elredis, key1: :value1
config :elredis, key2: :value2
config :elredis, [key3: :value3, key4: "value4"]

## TODO - implement support for defaults below
# pool_* keys defined for nodes in :redis_nodes would override these values.
#config :elredis, [
#  pool_reconnect_sleep_default: 3000,
#  pool_size_default: 100,
#  pool_max_count_default: 100,
#  pool_init_count_default: 10
#]

config :elredis, redis_nodes: [
  %{:name => :node1,
    :host => "127.0.0.1",
    :port => 6379,
    :database => 0,
    :password => "",
    :reconnect_sleep => 100,
    :connect_timeout => 5000,
    :pool_max_count => 100,
    :pool_init_count => 10,
    :pool_cool_interval => {10, :sec},
    :pool_max_age => {289, :sec},
    :ppol_queue_max => 5000,
    :pool_reconnect_sleep => 3000,
    :get_pool_member_timeout => 1000
  }
]