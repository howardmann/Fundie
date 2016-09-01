module ProjectsHelper
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
      "#{number_to_currency(project.target_shortfall, precision: 0)} shortfall"
    else
      "Fully funded!"
    end
  end

  def format_status(project)
    unless project.expired?
      format_shortfall(project)
    else
      "Expired"
    end
  end

  def format_goal(project)
    unless project.expired?
      "#{format_percent(project)} funded of #{format_target(project)} goal"
    else
      "Expired"
    end
  end

  def format_deadline(project)
    if project.deadline > Time.now
      "#{time_ago_in_words(project.deadline).capitalize} to go"
    else
      "#{time_ago_in_words(project.deadline).capitalize} overdue"
    end
  end

  def format_project_expired(project)
    "#{project.name} expired #{time_ago_in_words(project.deadline)}, no more pledges"
  end

  def format_description(project)
    truncate(project.description, length: 45, separator: ' ')
  end

  def format_image_tag(project)
    cl_image_tag(project.image, :width => 150, :height => 200, :crop => :fit)
  end
end
