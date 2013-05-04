class ApplicationController < ActionController::Base
  protect_from_forgery

  def page_subtitle
    @page_subtitle = ''
  end
end
