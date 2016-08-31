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

    # This is the magic stuff that will let us upload an image to Cloudinary when creating a new project.
    # HM!! Remember that we have to reference :file in the params as the cl form_for helper renders in html name="file" so we are pulling the file from params[:file] and then storying the Cloudinary url equivalent in the image tag
    req = Cloudinary::Uploader.upload(params[:file])
    @project = @current_user.projects.create(project_params)
    # Note that Cloudinary assigns each image a unique public_id which we pass as the url to be modified and transformed with the Cloudinary app
    @project.image = req["public_id"]
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
    req = Cloudinary::Uploader.upload(params[:file])
    @project = @current_user.projects.find(params[:id])
    @project.update(project_params)

    @project.image = req["public_id"]
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
