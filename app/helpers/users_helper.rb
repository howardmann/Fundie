module UsersHelper
  def own_user?
    @user == @current_user
  end

  def format_bank(user)
      number_to_currency(user.bank_left, precision: 0)
  end

  def format_pledges_received(user)
    number_to_currency(user.pledges.sum(:amount), precision: 0)
  end

  def format_session_user
    if @current_user
      link_to "@current_user: #{@current_user.name.titleize} logged in with bank funds of #{format_bank(@current_user)}", user_path(@current_user)
    else
      "Login above"
    end
  end

end
