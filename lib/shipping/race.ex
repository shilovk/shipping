defmodule Shipping.Race do
  use GenServer

  def start_link(passenger) do
    GenServer.start_link(__MODULE__, passenger, name: __MODULE__)
  end

  @impl GenServer
  def init(passenger), do: {:ok, passenger}

  @impl GenServer
  def handle_call({:start, start_loc, _end_loc}, _from, passenger) do
    GenServer.call(start_loc, {:remove, passenger})
    {:reply, passenger, passenger}
  end

  @impl GenServer
  def handle_call({:end, _start_loc, end_loc}, _from, passenger) do
    GenServer.call(end_loc, {:add, passenger})
    {:stop, :normal, passenger, passenger}
  end
end
