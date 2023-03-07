source 'https://rubygems.org'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'
gem 'sqlite3'
require_relative './models/task'

# get all tasks
get '/api/v1/tasks' do
  tasks = Task.all
  tasks.to_json
end

# create a new task
post '/api/v1/tasks' do
  request_body = JSON.parse(request.body.read)
  task = Task.new(request_body)
  if task.save
    task.to_json
  else
    halt 422, task.errors.to_json
  end
end

# update an existing task
put '/api/v1/tasks/:id' do
  request_body = JSON.parse(request.body.read)
  task = Task.find(params[:id])
  if task.update(request_body)
    task.to_json
  else
    halt 422, task.errors.to_json
  end
end

delete an existing task
delete '/api/v1/tasks/:id' do
  task = Task.find(params[:id])
  if task.destroy
    { message: 'Task deleted successfully' }.to_json
  else
    halt 422, task.errors.to_json
  end
end