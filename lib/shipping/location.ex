defmodule Shipping.Location do
  use GenServer

  def start_link(members, title) when not is_nil(title) do
    name = {:via, Registry, {Shipping.LocationRegistry, title}}
    GenServer.start_link(__MODULE__, members, name: name)
  end

  ## Callbacks

  @impl GenServer
  def init(members), do: {:ok, members}

  @impl GenServer
  def handle_call(:members, _from, members) do
    {:reply, members, members}
  end

  @impl GenServer
  def handle_call({:remove, passenger}, _from, members) do
    if(passenger in members, do: {:reply, :remove, MapSet.delete(members, passenger)}, else: {:reply, :error, members})
  end

  @impl GenServer
  def handle_call({:add, passenger}, _from, members) do
    {:reply, :add, MapSet.put(members, passenger)}
  end
end
