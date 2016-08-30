module PledgesHelper
  def own_pledge?(pledge)
    @current_user && @current_user.pledges.include?(pledge)
  end

end
