defmodule TasksAppWeb.TaskController do
  use TasksAppWeb, :controller
  alias TasksApp.Tasks
  alias TasksApp.Tasks.Task

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    render(conn, :index, tasks: tasks)
  end

  def new(conn, _params) do
    changeset = Tasks.change_task(%Task{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"task" => task_params}) do
    case Tasks.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created!")
        |> redirect(to: ~p"/tasks/#{task.id}")

      {:error, changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    render(conn, :show, task: task)
  end
end
