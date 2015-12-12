class EventsController < ApplicationController
  def my_signups
    @events = current_user.signup_events.where("held_on >= ?", DateTime.now).order(:held_on)
  end

  def my_past_signups
      @events = current_user.signup_events.where("held_on < ?", DateTime.now).order(held_on: :desc)
  end

  def past_events
    @events = Event.where("held_on < ?", DateTime.now).order(held_on: :desc)
  end

  def index

    @q = Event.ransack(params[:q])
    @events = @q.result.where("held_on >= ?", DateTime.now).order(:held_on)

  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.user_id = params[:user_id]
    @event.image = params[:image]
    @event.description = params[:description]
    @event.location = params[:location]
    @event.title = params[:title]
    @event.held_on = Chronic.parse(params[:held_on])
    @event.capacity = params[:capacity]


    if @event.save
      redirect_to "/events", :notice => "Event created successfully."
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    @event.user_id = params[:user_id]
    @event.image = params[:image]
    @event.description = params[:description]
    @event.location = params[:location]
    @event.title = params[:title]
    @event.held_on = Chronic.parse(params[:held_on])
    @event.capacity = params[:capacity]


    if @event.save
      redirect_to "/events", :notice => "Event updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    redirect_to "/events", :notice => "Event deleted."
  end
end
