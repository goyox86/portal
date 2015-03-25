defmodule PortalTest do
  use ExUnit.Case, async: false
  
  test "sets up the two doors setting up all the data in the left side" do
    Portal.shoot(:orange)
    Portal.shoot(:blue)
    Portal.transfer(:orange, :blue, [1, 2])
    assert Portal.Door.get(:orange) == [2, 1]
    assert Portal.Door.get(:blue) == []
  end

  test "returns a 'Portal' struct" do
    Portal.shoot(:foo)
    Portal.shoot(:bar)
    assert %Portal{left: :foo, right: :bar} = Portal.transfer(:foo, :bar, [1, 2])
  end

  test "pushes data to the right in the given 'portal'" do
    Portal.shoot(:black)
    Portal.shoot(:brown)
    portal = Portal.transfer(:black, :brown, [1, 2])
    Portal.push_right(portal)
    assert Portal.Door.get(:brown) == [2]
  end

  test "pushes data to the left in the given 'portal'" do
    Portal.shoot(:green)
    Portal.shoot(:red)
    portal = Portal.transfer(:green, :red, [1, 2])
    Portal.push_right(portal)
    Portal.push_right(portal)
    Portal.push_left(portal)
    assert Portal.Door.get(:green) == [1]
  end

  test "creates new doors for a given color" do
    {:ok, pid } = Portal.shoot(:magenta)
    assert pid
  end

  test "it returns the proper string representation of a portal" do
    Portal.shoot(:gray)
    Portal.shoot(:pink)
    portal = Portal.transfer(:gray, :pink, [1, 2])
    assert "#Portal<\n   :gray <=> :pink\n  [1, 2] <=> []\n>\n" == inspect(portal)
  end
end
