class UsersController < ApplicationController
  before_action :require_login, :only => [:index, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if params[:file]
      req = Cloudinary::Uploader.upload(params[:file])
      @user.image = req["public_id"]
    else
      @user.image = 'placeholder_y6he4n'
    end

    if @user.save
      flash[:success] = "User created"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = @current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if params[:file]
      req = Cloudinary::Uploader.upload(params[:file])
      @user.image = req["public_id"]
    else
      @user.image = 'placeholder_y6he4n'
    end

    if @user.save
      flash[:success] = "User updated"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    flash[:success] = "User deleted"
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :password, :image, :password_confirmation)
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
