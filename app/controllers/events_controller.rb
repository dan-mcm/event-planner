class EventsController < ApplicationController
    before_action :authenticate_user!

    def index
        
        # handling special case for passing parameter to endpoint enabling viewing of all active events
        @events = params[:show_all] == 'true' ? Event.all : (current_user ? current_user.events : [])

        respond_to do |format|
            format.html { render :index } 
            format.json { render json: @events }
        end
    end

    def show
        # @event = Event.find(params[:id])
        @events = params[:show_all] == 'true' ? Event.all : (current_user ? current_user.events : [])

        respond_to do |format|
            format.html { render :index } 
            format.json { render json: @events }
        end
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)

        if @event.save
            redirect_to events_path, notice: 'Event was successfully created.'
        else
            render :index
        end
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])

        if @event.update(event_params)
            redirect_to @event, notice: 'Event was successfully updated.'
        else
            flash[:alert] = 'Error updating event.'
            render :edit
        end
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        redirect_to events_url, notice: 'Event was successfully destroyed.'
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :location, :start_date, :end_date, :user_id)
    end
end
