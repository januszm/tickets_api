class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :update, :destroy]

  # GET /issues
  def index
    @issues = Issue.all
    authorize @issues

    render json: @issues
  end

  # GET /issues/1
  def show
    authorize @issue
    render json: @issue
  end

  # POST /issues
  def create
    @issue = Issue.new(issue_params)
    authorize @issue

    if @issue.save
      render json: @issue, status: :created, location: @issue
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /issues/1
  def update
    authorize @issue
    if @issue.update(issue_params)
      render json: @issue
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  # DELETE /issues/1
  def destroy
    authorize @issue
    @issue.destroy
  end

  private

    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(policy(Issue).permitted_attributes)
    end
end