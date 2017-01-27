require 'rails_helper'

describe AssignAgentToIssue, type: :service do

  let(:issue) { create(:issue) }
  let(:agent) { create(:user) }

  describe 'call' do

    it 'assigns support agent to issue' do
      initial_status = issue.status
      result = AssignAgentToIssue.new(issue, agent.id).call
      issue.reload
      expect(result).to be true
      expect(issue.assignee).to eq agent
      expect(issue.status).to_not eq initial_status
    end
  end
end
