class TasksController < ApplicationController
  def index
    if session[:user_id]
      @tasks = Task.where('user_id = ?',session[:user_id]).order('due_date DESC')
    else
      redirect_to '/login'
    end
  end

  def new
  end

  def create
    Task.create(task: params[:task], due_date: params[:due_date])
    redirect_to "/"
  end

  def update
    task = Task.find(params[:id])
    task.toggle!(:complete)
    redirect_to "/"
  end
end
