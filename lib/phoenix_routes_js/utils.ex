defmodule Utils do
  def deep_merge(left, right) when is_map(left) and is_map(right) do
    Map.merge(left, right, &deep_resolve/3)
  end

  defp deep_resolve(_key, left = %{}, right = %{}) do
    deep_merge(left, right)
  end

  defp deep_resolve(_key, _left, right), do: right
end


# defmodule MapUtils.Test do
  # use ExUnit.Case

  # test 'one level of maps without conflict' do
    # result = MapUtils.deep_merge(%{a: 1}, %{b: 2})
    # assert result == %{a: 1, b: 2}
  # end

  # test 'two levels of maps without conflict' do
    # result = MapUtils.deep_merge(%{a: %{b: 1}}, %{a: %{c: 3}})
    # assert result == %{a: %{b: 1, c: 3}}
  # end

  # test 'three levels of maps without conflict' do
    # result = MapUtils.deep_merge(%{a: %{b: %{c: 1}}}, %{a: %{b: %{d: 2}}})
    # assert result == %{a: %{b: %{c: 1, d: 2}}}
  # end

  # test 'non-map value in left' do
    # result = MapUtils.deep_merge(%{a: 1}, %{a: %{b: 2}})
    # assert result == %{a: %{b:  2}}
  # end

  # test 'non-map value in right' do
    # result = MapUtils.deep_merge(%{a: %{b: 1}}, %{a: 2})
    # assert result == %{a: 2}
  # end

  # test 'non-map value in both' do
    # result = MapUtils.deep_merge(%{a: 1}, %{a: 2})
    # assert result == %{a: 2}
  # end
# end
