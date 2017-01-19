class Issue < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  include AASM

  aasm column: 'status' do
    state :opened, initial: true
    state :assigned
    state :closed

    event :set_assigned do
      transitions from: [:opened, :assigned], to: :assigned
    end

    event :finalize do
      transitions from: :assigned, to: :closed
    end

  end

  def self.statuses
    aasm.states.map(&:name)
  end

end
