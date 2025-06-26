# tasks_app_web/components/task_components.ex
defmodule TasksAppWeb.TaskComponents do
  use Phoenix.Component

  attr :task, :map, required: true
  def task_card(assigns) do
    ~H"""
    <div class="border rounded p-4 mb-4">
      <h2><%= @task.title %></h2>
      <p><%= @task.description %></p>
    </div>
    """
  end
end
