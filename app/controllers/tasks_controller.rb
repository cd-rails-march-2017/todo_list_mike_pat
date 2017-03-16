class TasksController < ApplicationController
  @@show_all ||= true
  def index
    @show_all = @@show_all
    if session[:user_id]
      if @@show_all
        @tasks = Task.where('user_id = ?',session[:user_id]).order('due_date')
      else
        @tasks = Task.where('user_id = ? AND complete = ?',session[:user_id], false).order('due_date')
      end
    else
      redirect_to '/login'
    end
  end
  def show_hide
    @@show_all= !@@show_all
    redirect_to '/'
  end
  def new
  end

  def create
    if session[:user_id]
      task = Task.create(item: params[:item], due_date: params[:due_date], user_id: session[:user_id])
      puts "HELOOO #{task.errors.inspect}"
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
