# frozen_string_literal: true

class Admin::BadgeAcquisitionsController < Admin::BaseController
  before_action :find_badge_acquisition, only: :destroy

  def index
    @badge_acquisitions = BadgeAcquisition.all
  end

  def destroy
    @badge_acquisition.destroy

    redirect_to admin_badge_acquisitions_path
  end

  private

  def find_badge_acquisition
    @badge_acquisition = BadgeAcquisition.find(params[:id])
  end
end
