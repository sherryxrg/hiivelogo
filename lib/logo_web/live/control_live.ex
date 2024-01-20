defmodule LogoWeb.ControlLive do
  use LogoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, key: "")}
  end

  def handle_event("press", %{"key" => key}, socket) do
    IO.inspect(key)

    {:noreply, assign(socket, key: key)}
  end

  # def handle_event("press", %{"key" => "ArrowRight"}, socket) do
  #   IO.inspect("Right")

  #   {:noreply, assign(socket, key: "Right")}
  # end

  def handle_event("press", _, socket) do
    IO.inspect("Unknown Key")

    {:noreply, assign(socket, key: "")}
  end

  def render(assigns) do
    ~H"""
    <div id="control" phx-window-keydown="press">
      <h2><%= @key %></h2>
    </div>
    """
  end
end
