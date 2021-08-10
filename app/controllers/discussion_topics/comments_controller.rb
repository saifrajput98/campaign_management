# frozen_string_literal: true

module DiscussionTopics
  class CommentsController < CommentsController
    before_action :set_commentable

    private

    def set_commentable
      @commentable = DiscussionTopic.find(params[:discussion_topics_id])
    end
  end
end
