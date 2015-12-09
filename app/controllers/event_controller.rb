class EventController < ApplicationController


  # get_events helper method in event_helper.rb  
  def index
    #  @events = Event.where(["start_date >= ?", Date.today]).paginate(
    #    :page => params[:page], :per_page => 12) 
    @events = Event.joins("LEFT JOIN zipcodes ON events.zipcode = zipcodes.zip").select("events.*, zipcodes.lat, zipcodes.long, zipcodes.city, zipcodes.state").where(["start_date >= ?", Date.today]).paginate(:page => params[:page], :per_page => 12) 
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.lat
      marker.lng event.long
      marker.infowindow ("#{event.title}<br> 
                         #{event.start_date.strftime("%I:%M %p")}<br> 
                         #{event.start_date.strftime("%a, %b %d")}<br>
                         #{event.city}, #{event.state}")
    end

  end

  def index_past
    @events = Event.where(["start_date < ?", Date.today]).paginate(:page => params[:page], :per_page => 12) 
  end

  def show
    @event = Event.find(params[:id])
    @event_location = Zipcode.find_by(zip: @event.zipcode)
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to root_path
    elsif
      render 'new'
    end
  end




  private
  def event_params
    params.require(:event).permit(:title, :description, :start_date, 
                                  :end_date, :max_attendees, :event_pic, :zipcode)
  end
end
