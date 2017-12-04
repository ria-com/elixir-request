defmodule Ria.Request do
  @moduledoc """
  Ria.Request - simple request library
  """

  def json(url), do: json(url, [{"Accept", "application/json"}, {"Content-Type", "application/json"}])
  def json(url, headers) when is_list(headers) do
    case HTTPoison.get(url, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> Poison.decode! body
      {:ok, %HTTPoison.Response{status_code: 201, body: body}} -> Poison.decode! body
      _ -> nil
    end
  end
  def json(url, body), do: json(url, body, [{"Accept", "application/json"}, {"Content-Type", "application/json"}])
  def json(url, body, headers) do
    case HTTPoison.post(url, body, headers, hackney: [:insecure]) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> Poison.decode! body
      {:ok, %HTTPoison.Response{status_code: 201, body: body}} -> Poison.decode! body
      _ -> nil
    end
  end

  def html(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> body
      {:ok, %HTTPoison.Response{status_code: 201, body: body}} -> body
      _ -> ""
    end
  end
  def html(url, body) do
    case HTTPoison.post(url, body, []) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> body
      {:ok, %HTTPoison.Response{status_code: 201, body: body}} -> body
      _ -> ""
    end
  end

  @doc """
  Convert map to querystring

  ## Examples

      iex> Ria.Request.to_query %{x: 1, y: 2}
      "x=1&y=2"
  """
  def to_query(map) do
    map
    |> Map.to_list
    |> Enum.map(fn({k,v})-> "#{k}=#{v}" end)
    |> Enum.join("&")
  end
end
