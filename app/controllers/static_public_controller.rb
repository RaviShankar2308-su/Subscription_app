class StaticPublicController < ApplicationController
  skip_before_action :authenticate_user!
  def landing_page
  end

  def privacy
  end

  def terms
  end
end
