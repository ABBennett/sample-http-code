require "sinatra"
require "pry"


get "/tasks" do
  @tasks = File.readlines("tasks.txt")
  erb :index
end

post "/tasks" do
  # Read the input from the form the user filled out

  task = params["task_name"]

  # Open the "tasks.txt" file and append the task
  File.open("tasks.txt", "a") do |file|
    file.puts(task)
  end

  # Send the user back to the home page which shows
  # the list of tasks
  redirect "/tasks"
end



get "/tasks/:task_name" do
  @task_name = params[:task_name]
  erb :show
end
