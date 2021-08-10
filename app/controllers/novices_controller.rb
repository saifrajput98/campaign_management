# frozen_string_literal: true

class NovicesController < ApplicationController
  before_action :set_novice, only: %i[edit update]

  def index
    @novices = Novice.all
  end

  def edit; end

  def update
    if @novice.update(user_params)
      redirect_to novices_path
    else
      render 'edit'
    end
  end

  private

  def set_novice
    @novice = Novice.find(params[:id])
  end

  def user_params
    params.require(:novice).permit(:status)
  end
end
