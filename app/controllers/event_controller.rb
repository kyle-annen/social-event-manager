class EventController < ApplicationController
  def index
    @events = Event.paginate(:page => params[:page], :per_page => 9) 
  end

  def show
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
                                    :end_date, :max_attendees)

end
