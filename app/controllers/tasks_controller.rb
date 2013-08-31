class TasksController < ApplicationController

  def create
    task = Task.create name: params[:name], project_id: params[:project_id], is_completed: false
    if task.valid?
      redirect_to '/'
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    task_params = params[:task]
    date = Date.civil(
        task_params["deadline(1i)".to_sym].to_i,
        task_params["deadline(2i)".to_sym].to_i,
        task_params["deadline(3i)".to_sym].to_i)
    if @task.update_attributes(
        name: task_params[:name],
        description: task_params[:description],
        priority: task_params[:priority],
        deadline: date)
      flash[:success] = 'Update succeeded'
      redirect_to '/'
    end
  end

  def destroy
    Task.destroy params[:id]
    redirect_to '/'
  end

  def set_state
    task = Task.find(params[:id])
    task.change_state
    render json: {success: true, task_id: params[:id], completed: task.is_completed?}
  end

end
