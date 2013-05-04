class PagesController < ApplicationController

  layout 'no_sidebar'

  before_filter :page_subtitle

  def home
    @actions = [
        {label: 'Plan a Trip', target: '#', icon: 'icon-bus-sign'},
        {label: 'Identify Places', target: '#', icon: 'icon-map-marker'},
        {label: 'Change My Settings', target: '#', icon: 'icon-cog'},
        {label: 'Help & Support', target: '#', icon: 'icon-question-sign'},
    ]
  end

end
