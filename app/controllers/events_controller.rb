class EventsController < ApplicationController

    def index
        # @events = Event.all
        @events = current_user ? current_user.events : []
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)

        if @event.save
            redirect_to @event, notice: 'Event was successfully created.'
        else
            render :new
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
        params.require(:event).permit(:title, :description, :start_date, :end_date, :user_id)
    end
end