class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_one :creator
  has_one :assignee
end
