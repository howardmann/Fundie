module PledgesHelper

  def format_pledge_details(pledge)
    "#{number_to_currency(pledge.amount)} from #{pledge.user.name}"
  end

end
