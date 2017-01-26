class FinalizeIssue

  def initialize(issue_id)
    @issue = Issue.find(issue_id)
  end

  def call
    return false if @issue.closed?
    @issue.finalize
    @issue.save
  end

end
