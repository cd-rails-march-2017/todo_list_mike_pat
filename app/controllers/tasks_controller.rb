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
    if session[:user_id]
      Task.create(item: params[:item], due_date: params[:due_date], user_id: session[:user_id])
      redirect_to "/"
    else
      flash[:error] = ["Need to Log in"]
      redirect_to '/login'
    end
  end

  def update
    task = Task.find(params[:id])
    task.toggle!(:complete)
    redirect_to "/"
  end
end
