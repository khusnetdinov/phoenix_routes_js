defmodule PhoenixRoutesJs.ViewTest do
  use ExUnit.Case

  alias Plug.Conn

  describe "#render_gon_script" do
    test 'text' do
      actual = PhoenixGon.View.render_routes_script(%Conn{})

      assert {:safe, _} = actual
    end
  end
end
