defmodule ChatApp.ChatRoomChannel do
  use Phoenix.Channel

  def join("chat_room:lobby", _params, socket) do
    {:ok, socket}
  end

  def handle_in("send_msg", %{"body" => body, "user" => user}, socket) do
    broadcast!(socket, "new_msg", %{body: body, user: user})
    {:noreply, socket}
  end

  def handle_in(event, payload, socket) do
    IO.puts "Received unexpected event: #{inspect(event)} with payload: #{inspect(payload)}"
    {:noreply, socket}
  end
end
