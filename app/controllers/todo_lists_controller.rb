# frozen_string_literal: true

class TodoListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: %i[new create index edit]
  before_action :set_todo_list, only: %i[show edit update destroy]

  def index
    @todo_lists = @campaign.todo_lists
  end

  def new
    @todo_list = @campaign.todo_lists.new
  end

  def edit; end

  def create
    @todo_list = @campaign.todo_lists.create(list_params)

    if @todo_list.save
      redirect_to campaign_todo_lists_path
    else
      render 'new'
    end
  end

  def update
    if @todo_list.update(list_params)
      redirect_to campaign_todo_lists_path
    else
      render 'edit'
    end
  end

  def destroy
    @todo_list.destroy

    redirect_to campaign_todo_lists_path
  end

  def show; end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  def list_params
    params.require(:todo_list).permit(:objective, :user_id)
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
