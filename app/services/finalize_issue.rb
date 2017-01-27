class FinalizeIssue

  def initialize(issue)
    @issue = issue
  end

  def call
    return false if @issue.closed?
    @issue.finalize
    @issue.save
  end

end
