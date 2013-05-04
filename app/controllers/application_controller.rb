class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :page_subtitle

  def page_subtitle
    @page_subtitle = ''
  end

  def current_user
    # TODO Just a placeholder for now
    User.first
  end

end
