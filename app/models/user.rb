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

  # Logic

end
