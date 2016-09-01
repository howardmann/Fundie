module ApplicationHelper
  def current_user?
    @current_user.present?
  end

  def check_project(project)
    current_user? && @current_user.projects.include?(project)
  end

  def check_pledge(project)
    current_user? && @current_user.pledges.pluck(:project_id).include?(project.id)
  end

  def format_created(object)
    "#{time_ago_in_words(object.created_at).capitalize} ago"
  end

  def format_updated(object)
    "#{time_ago_in_words(object.updated_at).capitalize} ago"
  end

  def format_app_summary
    projects = pluralize(Project.live_projects.count,'live project')
    pledge_total = number_to_currency(Pledge.sum_total, precision: 0)
    "Running stats: #{projects}, #{pledge_total} pledged"
  end
end
