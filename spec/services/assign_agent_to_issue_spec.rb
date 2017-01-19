require 'rails_helper'

describe AssignAgentToIssue, type: :service do

  let(:issue) { create(:issue) }
  let(:agent) { create(:user) }

  describe 'call' do
    let(:params) do
      { id: issue.id, agent_id: agent.id }
    end

    it 'assigns support agent to issue' do
      initial_status = issue.status
      result = AssignAgentToIssue.new(params[:id], params[:agent_id]).call
      issue.reload
      expect(result).to be true
      expect(issue.assignee).to eq agent
      expect(issue.status).to_not eq initial_status
    end
  end
end
