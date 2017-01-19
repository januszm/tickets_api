class AssignAgentToIssue

  def initialize(issue_id, agent_id)
    @issue = Issue.find(issue_id)
    @agent = User.find(agent_id)
  end

  def call
    return false if @issue.closed?
    return false unless @agent
    @issue.assignee = @agent
    @issue.set_assigned unless @issue.assigned?
    @issue.save
  end

end
