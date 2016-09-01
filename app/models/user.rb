# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  # Validations
  validates :name, :email, presence: true
  validates :password, length: { minimum: 6, allow_blank: true }

  # Associations
  has_secure_password
  has_many :projects
  has_many :pledges
  # has_many :assigned_pledges, :through => :projects, :table_name => "pledges"

  # Logic
  def projects_pledges_sum
    if self.projects.length > 0
      # Use map to return an array of project pledges
      project_pledges = self.projects.map do |p|
        p.pledges
      end
      # Flatten the array and then use reduce to return the total sum amount
      project_pledges.flatten!.reduce(0) do |sum, pledge|
        sum + pledge.amount
      end
    else
      0
    end
  end

  def bank_left
    self.bank - self.pledges.sum(:amount) + self.projects_pledges_sum
  end

end
