class EventController < ApplicationController


  # get_events helper method in event_helper.rb  
  def index
    @events = Event.where(["start_date >= ?", Date.today]).paginate(:page => params[:page], :per_page => 12) 
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
    
    
  end
  

  private
    def event_params
      params.require(:event).permit(:title, :description, :start_date, 
                                    :end_date, :max_attendees, :event_pic, :zipcode)

end
