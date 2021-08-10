# frozen_string_literal: true

class CampaignsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: %i[show edit update destroy]

  def index
    @campaigns = Campaign.search(params[:term])
  end

  def show; end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.new(campaign_params)
    authorize @campaign
    if @campaign.save
      redirect_to campaigns_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @campaign.update(campaign_params)
      redirect_to campaigns_path
    else
      render 'edit'
    end
  end

  def destroy
    @campaign.destroy

    redirect_to campaigns_path
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:title, :purpose, :estimated_duration, :all_tags, :user_id)
  end
end
