defmodule Utils do
  def deep_merge(left, right) when is_map(left) and is_map(right) do
    Map.merge(left, right, &deep_resolve/3)
  end

  defp deep_resolve(_key, left = %{}, right = %{}) do
    deep_merge(left, right)
  end

  defp deep_resolve(_key, _left, right), do: right
end

