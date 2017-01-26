require 'rails_helper'

describe FinalizeIssue, type: :service do

  let(:issue) { create(:issue, status: 'assigned') }

  describe 'call' do
    let(:params) do
      { id: issue.id }
    end

    it 'does not finalize closed issue' do
      initial_status = issue.status
      result = FinalizeIssue.new(params[:id]).call
      issue.reload
      expect(result).to be true
      expect(issue.closed?).to be true
      expect(issue.status).to_not eq initial_status
    end
  end
end
