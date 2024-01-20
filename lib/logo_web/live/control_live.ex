defmodule LogoWeb.ControlLive do
  use LogoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, [])}
  end

  # def handle_event("test", %{"number" => })

  def render(assigns) do
    ~H"""
    <h1>Hello World</h1>
    """
  end
end
