class PagesController < ApplicationController

  layout 'no_sidebar'

  def home
    @actions = [
        {img: 'plan-a-trip.png', label: 'Plan a Trip', target: '#'},
        {img: 'identify-places.png', label: 'Identify Places', target: '#'},
        {img: '100px-Settings_Tile.svg.png', label: 'Change My Settings', target: '#'},
        {img: 'Blue_question_mark_icon.png', label: 'Help & Support', target: '#'},
    ]
  end

end
