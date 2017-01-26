class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status
  has_one :creator
  has_one :assignee
end
