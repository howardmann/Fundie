class ProjectsController < ApplicationController
  before_action :require_login, :only => [:new, :edit]

  def z_find_pledge
    @projects = Project.all
  end

  def index
    @projects = Project.all.sort_by do |project|
      project.pledge_sum
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = @current_user.projects.create(project_params)
    if @project.save
      flash[:success] = "New project created"
      redirect_to user_path(@current_user)
    else
      render :new
    end
  end

  def edit
    @project = @current_user.projects.find(params[:id])
  end

  def update
    @project = @current_user.projects.find(params[:id])
    @project.update(project_params)
    if @project.save
      flash[:success] = "Project updated"
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = @current_user.projects.find(params[:id])
    @project.destroy
    flash[:success] = "Project deleted"
    redirect_to user_path(@current_user)
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :target_amount, :deadline,  {category_ids: []})
    end

    def require_login

      unless @current_user.present?
        # For redirecting to intended url. Save the request.url in a session
        session[:intended_url] = request.url
        flash[:error] = "You must be logged in to access this page"
        redirect_to login_path
      end

    end

end
