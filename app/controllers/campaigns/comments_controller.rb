# frozen_string_literal: true

module Campaigns
  class CommentsController < CommentsController
    before_action :set_commentable

    private

    def set_commentable
      @commentable = Campaign.find(params[:campaign_id])
    end
  end
end
