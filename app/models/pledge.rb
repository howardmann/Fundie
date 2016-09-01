# == Schema Information
#
# Table name: pledges
#
#  id         :integer          not null, primary key
#  amount     :decimal(, )
#  comment    :text
#  user_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


# class MyValidator < ActiveModel::Validator
#   # (record) references the new Pledge that is about to be created in this instance. Check binding.pry if you are interested
#   def validate(record)
#     unless record.user.bank_left > record.amount
#       record.errors[:amount] << 'pledged cannot be more than your bank funds!'
#     end
#   end
# end

class Pledge < ActiveRecord::Base
  # Custom validator above
  # include ActiveModel::Validations
  # validates_with MyValidator
  # Validations
  validates :amount, numericality: {greater_than: 0}

  # Associations
  belongs_to :user
  belongs_to :project

  # Logic
  def self.sum_total
    self.all.sum(:amount)
  end

end
