defmodule ChatApp.ChatRoomChannel do
  use Phoenix.Channel

  # Users join the chat room lobby
  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def handle_in("send_msg", %{"body" => body, "user" => user} = _, socket) do
    broadcast!(socket, "new_msg", %{body: body, user: user})
    {:noreply, socket}
  end
end
