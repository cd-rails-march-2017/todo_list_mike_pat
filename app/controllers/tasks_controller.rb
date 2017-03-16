class TasksController < ApplicationController
  def index
    @tasks = Task.find_by_user_id(session[:user_id]).order('due_date DESC')
  end

  def new
  end

  def create
    Task.create(task: params[:task], due_date: params[:due_date])
    redirect_to "/"
  end

  def update
    task = Task.find(params[:id])
    task.complete.toggle!
    redirect_to "/"
  end
end
