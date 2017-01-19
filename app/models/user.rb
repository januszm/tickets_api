class User < ApplicationRecord
  has_many :created_issues, class_name: 'Issue', as: :creator
  has_many :assigned_issues, class_name: 'Issue', as: :assignee

  has_secure_password

  def full_name
    [first_name, last_name].join(' ')
  end

end
