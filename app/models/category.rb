# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_and_belongs_to_many :projects


  # LOGIC
  def live_projects
    projects.select do |el|
      el.expired? == false
    end
  end

  def expired_projects
    projects.select do |el|
      el.expired?
    end
  end

  def funded_projects
    projects.select do |el|
      el.shortfall? == false
    end
  end

end
