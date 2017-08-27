defmodule PhoenixRoutesJs.Routes do
  @doc """
  Returns named routes from router module
  """
  def fetch(router) do
    group_by_path(router.__routes__)
  end

  @doc false
  defp group_by_path(routes), do: group_by_path(routes, %{})

  @doc false
  defp group_by_path([route | routes], paths) do
    %{helper: helper, opts: action, path: path} = route

    case helper do
      nil ->
        group_by_path(routes, paths)
      _ ->
        path = %{helper => %{action => path}}
        updated_paths = Utils.deep_merge(paths, path)
        group_by_path(routes, updated_paths)
    end
  end

  @doc false
  defp group_by_path([], paths), do: paths
end
