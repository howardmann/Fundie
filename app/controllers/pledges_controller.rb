class PledgesController < ApplicationController
  before_action :require_login, :only => [:show, :new, :edit]
  before_action :require_current_project, :only => [:new, :edit]

  def index
    @pledges = Pledge.all.order('amount desc')
  end

  def show
    @pledge = Pledge.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @pledge = @project.pledges.new
  end

  def create
    @project = Project.find(params[:project_id])
    @pledge = @current_user.pledges.create(pledge_params)
    if @pledge.save
      @project.pledges << @pledge
      flash[:success] = "Succesfully pledged"
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    @pledge = @current_user.pledges.find(params[:id])
  end

  def update
    @pledge = Pledge.find(params[:id])
    @pledge.update(pledge_params)
    if @pledge.save
      flash[:success] = "Pledge updated"
      redirect_to user_path(@current_user)
    else
      render :edit
    end
  end

  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy
    flash[:success] = "Pledge deleted"
    redirect_to user_path(@current_user)
  end

  private
    def pledge_params
      params.require(:pledge).permit(:amount, :comment, :user_id, :project_id)
    end

    def require_login
      unless @current_user.present?
        # For redirecting to intended url. Save the request.url in a session
        session[:intended_url] = request.url
        flash[:error] = "You must be logged in to access this page"
        redirect_to login_path
      end
    end

    def require_current_project
      @project = Project.find(params[:project_id])
      if @project.deadline < Time.now
        flash[:error] = "Project expired no more pledging"
        redirect_to project_path(@project)
      end
    end

end
