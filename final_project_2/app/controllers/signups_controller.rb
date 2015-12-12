class SignupsController < ApplicationController
  def index
    @signups = Signup.all
  end

  def show
    @signup = Signup.find(params[:id])
  end

  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new
    @signup.guest_name = params[:guest_name]
    @signup.identifier = params[:identifier]
    @signup.event_id = params[:event_id]
    @signup.user_id = params[:user_id]

    if @signup.save
      redirect_to :back, :notice => "Signup created successfully."
    else
      render 'new'
    end
  end

  def edit
    @signup = Signup.find(params[:id])
  end

  def update
    @signup = Signup.find(params[:id])

    @signup.guest_name = params[:guest_name]
    @signup.identifier = params[:identifier]
    @signup.event_id = params[:event_id]
    @signup.user_id = params[:user_id]

    if @signup.save
      redirect_to :back, :notice => "Signup updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @signup = Signup.find(params[:id])

    @signup.destroy

    redirect_to :back, :notice => "Signup deleted."
  end
end
