# TODO: not being used

class PropertyKeywordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_property

  private

  def set_property
    @property = if authorized_user.can_admin_system?
      Property.find(params[:property_id])
    else
      current_user.properties.find(params[:property_id])
    end
  end
end
