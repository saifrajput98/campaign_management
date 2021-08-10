class CampaignPolicy
  attr_reader :user, :campaign

  def initialize(user, campaign)
    @user = user
    @campaign = campaign
  end

  def create?
    user.Expert?
  end
end
