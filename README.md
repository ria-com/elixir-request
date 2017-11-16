# Ria.Request

  Ria.Request - simple request library

```elixir
alias Ria.Request

# ...

# returns decoded value or nil
Request.json(url)                #get
Request.json(url, headers)       #get
Request.json(url, body)          #post
Request.json(url, body, headers) #post

# returns bitstring or empty bitstring
Request.html(url)                #get
Request.html(url, body)          #post

Request.to_query(%{x: 1, y: 2})
```

## Installation

```elixir
def deps do
  [{:ria_request, git: "https://github.com/ria-com/elixir-request.git"}]
end
```

## Testing

```bash
[elixir-request]# mix test
```
