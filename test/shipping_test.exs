defmodule ShippingTest do
  use ExUnit.Case
  doctest Shipping

  test "adventure" do
    assert ["wolf", "cabbage", "goat"] = Shipping.adventure
  end
end
