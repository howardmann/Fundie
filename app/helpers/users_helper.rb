module UsersHelper
  def own_user?
    @user == @current_user
  end

end
