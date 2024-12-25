class EventsController < ApplicationController
  def index
    @events = Event.all
    @events = Post.where(is_event: true)
  end
end
