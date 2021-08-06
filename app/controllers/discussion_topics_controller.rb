# frozen_string_literal: true

class DiscussionTopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: %i[new index edit]
  before_action :set_discussion_topic, only: %i[show edit update destroy]

  def index
    @discussion_topics = @campaign.discussion_topics
  end

  def new
    @discussion_topic = @campaign.discussion_topics.new
  end

  def edit; end

  def create
    @discussion_topic = DiscussionTopic.create(topics_params)

    if @discussion_topic.save
      redirect_to campaign_discussion_topic_path
    else
      render 'new'
    end
  end

  def update
    if @discussion_topic.update(topics_params)
      redirect_to campaign_discussion_topic_path
    else
      render 'edit'
    end
  end

  def destroy
    @discussion_topic.destroy

    redirect_to campaign_discussion_topics_path
  end

  def show; end

  private

  def set_discussion_topic
    @discussion_topic = DiscussionTopic.find(params[:id])
  end

  def topics_params
    params.require(:discussion_topic).permit(:title, :user_id)
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
