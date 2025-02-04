defmodule ChatAppWeb.ChatRoomChannelTest do
  use ChatAppWeb.ChannelCase

  setup do
    {:ok, _, socket} =
      ChatAppWeb.UserSocket
      |> socket("user_id", %{some: :assign})
      |> subscribe_and_join(ChatAppWeb.ChatRoomChannel, "chat_room:lobby")

    %{socket: socket}
  end

  test "ping replies with status ok", %{socket: socket} do
    ref = push(socket, "ping", %{"hello" => "there"})
    assert_reply ref, :ok, %{"hello" => "there"}
  end

  test "shout broadcasts to chat_room:lobby", %{socket: socket} do
    push(socket, "shout", %{"hello" => "all"})
    assert_broadcast "shout", %{"hello" => "all"}
  end

  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from!(socket, "broadcast", %{"some" => "data"})
    assert_push "broadcast", %{"some" => "data"}
  end

  test "broadcasts new_msg to the client", %{socket: socket} do
    broadcast_from!(socket, "new_msg", %{"body" => "hello", "user" => "test"})
    assert_push "new_msg", %{"body" => "hello", "user" => "test"}
  end

  test "sends msg to the client", %{socket: socket} do
    push(socket, "send_msg", %{"body" => "hello", "user" => "test"})
    assert_broadcast "new_msg", %{body: "hello", user: "test"}
  end
end
