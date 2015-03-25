defmodule DoorTest do
  use ExUnit.Case

  test "start_link it returns a PID " do
    {:ok, door} = Portal.Door.start_link(:white)
    assert door
  end

  test "gets the current data in the door" do
    Portal.Door.start_link(:white)
    assert Portal.Door.get(:white) == []
  end

  test "pushes a value into the door" do
    Portal.Door.start_link(:white)
    Portal.Door.push(:white, 1)
    assert Portal.Door.get(:white) == [1]
  end

  test "returns :error when trying to pop from an empty door" do
    Portal.Door.start_link(:white)
    assert Portal.Door.pop(:white) == :error
  end

  test "returns {:ok, value} when trying to pop when something is inside" do
    Portal.Door.start_link(:white)
    Portal.Door.push(:white, 1)
    assert {:ok, 1} == Portal.Door.pop(:white)
  end
end

