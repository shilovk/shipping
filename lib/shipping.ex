defmodule Shipping do
  @moduledoc """
  Documentation for `Shipping`.
  """

  alias Shipping.{Location, Race}

  def adventure do
    members = ~w[wolf goat cabbage]a
    location_a = location(members, "Location A")
    location_b = location([], "Location B")
    races(location_a, location_b)
    GenServer.call(location_b, :members)
  end

  defp location(members, title) do
    {:ok, pid} = Location.start_link(members, title)
    pid
  end

  defp races(location_a, location_b) do
    race(location_a, location_b, "goat")
    race(location_b, location_a, "")
    race(location_a, location_b, "wolf")
    race(location_b, location_a, "goat")
    race(location_a, location_b, "cabbage")
    race(location_b, location_a, "")
    race(location_a, location_b, "goat")
  end

  defp race(location_a, location_b, passenger) do
    {:ok, pid} = Race.start_link(passenger)
    GenServer.call(pid, {:start, location_a, location_b})
    GenServer.call(pid, {:end, location_a, location_b})
    pid
  end
end
