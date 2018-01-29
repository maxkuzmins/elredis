# Elredis

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elredis` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elredis, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elredis](https://hexdocs.pm/elredis).

## Examples
### Connecting to a Redis cluster

```elixir
Elredis.start_link_cluster([
    {'127.0.0.1', 7000, 0, String.codepoints(""), 100, 5000}, 
    {'127.0.0.1', 7001, 0, String.codepoints(""), 100, 5000},
    {'127.0.0.1', 7002, 0, String.codepoints(""), 100, 5000}
])
{:ok, #PID<0.125.0>}
```
