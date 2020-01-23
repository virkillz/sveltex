defmodule Sveltex do
  @moduledoc """
  Sveltex is a small library to make embedding svelte component as easy as possible when it comes to works with Phoenix.
  """

  @doc """
  Main function to turn markup into html component which later on being parsed by the javascript side.

  ## Examples

      iex> Sveltex.hello()
      :world

  """
  def sveltex(name, props) do
    Phoenix.HTML.Tag.tag(:div,
      data: [props: payload(props)],
      id: "sveltex-#{String.replace(name, " ", "-")}"
    )
  end

  defp payload(props) do
    props
    |> Jason.encode()
    |> case do
      {:ok, message} -> message
      {:error, _} -> ""
    end
  end
end
