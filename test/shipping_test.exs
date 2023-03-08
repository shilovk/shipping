defmodule ShippingTest do
  use ExUnit.Case
  doctest Shipping

  test "adventure" do
    passengers = ~w[cabbage goat wolf]a
    assert passengers == MapSet.to_list(Shipping.adventure(passengers))
  end
end
