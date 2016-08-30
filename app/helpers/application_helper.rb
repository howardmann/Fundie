module ApplicationHelper
  def current_user?
    @current_user.present?
  end

  def check_project(project)
    current_user? && @current_user.projects.include?(project)
  end

  def check_pledge(pledge)
    current_user? && @current_user.pledges.include?(pledge)
  end

  def format_backers(project)
    pluralize(project.pledges.count, 'backer')
  end

  def format_target(project)
    number_to_currency(project.target_amount, precision: 0)
  end

  def format_pledged(project)
    number_to_currency(project.pledge_sum, precision: 0)
  end

  def format_percent(project)
    number_to_percentage(project.target_percent, precision: 0)
  end

  def format_shortfall(project)
    if project.shortfall?
      "#{number_to_currency(project.target_shortfall, precision: 0)} left to go"
    else
      "Fully funded!"
    end
  end

  def format_app_summary
    projects = pluralize(Project.all.count,'project')
    pledge_total = number_to_currency(Pledge.all.sum(:amount), precision: 0)
    "PROTOYPE has raised over #{pledge_total} for over #{projects} and counting"
  end

  def format_categories(project)
    project.categories.pluck(:name).join(', ').titleize
  end

end
