defmodule ChangeTrackingBugWeb.DemoLive do
  use ChangeTrackingBugWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, items: ~w[foo bar baz qux quux])}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <form phx-change="change">
      <p>Selected item is <%= inspect @choice %>.</p>
      <select name="choice">
        <%= for item <- @items do %>
          <option selected={item == @choice}><%= item %></option>
        <% end %>
      </select>
    </form>
    """
  end

  @impl true
  def handle_params(params, _uri, socket) do
    {:noreply, assign(socket, choice: params["choice"])}
  end

  @impl true
  def handle_event("change", %{"choice" => choice}, socket) do
    {:noreply, push_patch(socket, to: "/#{choice}")}
  end
end
