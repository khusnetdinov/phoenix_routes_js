defmodule Utils do
  @doc """
  Merge 2 maps deeply
  """
  def deep_merge(left, right) when is_map(left) and is_map(right) do
    Map.merge(left, right, &deep_resolve/3)
  end

  @doc false
  defp deep_resolve(_key, left = %{}, right = %{}) do
    deep_merge(left, right)
  end

  @doc false
  defp deep_resolve(_key, _left, right), do: right
end

