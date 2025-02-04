defmodule ChatAppWeb.ChatRoomChannel do
  use ChatAppWeb, :channel

  @impl true
  def join("chat_room:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (chat_room:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    broadcast!(socket, "shout", payload)
    {:noreply, socket}
  end

  @impl true
  def handle_in("send_msg", %{"body" => body, "user" => user}, socket) do
    broadcast!(socket, "new_msg", %{body: body, user: user})
    {:noreply, socket}
  end

  @impl true
  def handle_in(event, payload, socket) do
    IO.puts "Received unexpected event: #{inspect(event)} with payload: #{inspect(payload)}"
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
