class EventsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  before_action :is_admin?, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(post_params)
    @event.event_admin = current_user

    if @event.save
      redirect_to event_path(@event.id), success: "Evénement créé avec succès !"
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])

  end

  def update
    @event = Event.find(params[:id])
    if @event.update(post_params)
      flash[:notice] = "Event édité !"
      redirect_to event_path(@event.id)
    else
      flash.now[:alert] = "Impossible d'éditer l'évènement' :"
      render :edit
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to root_path
  end



  private

    def authenticate_user
      unless current_user
        flash[:danger] = "Il faut s'enregistrer bb"
        redirect_to new_user_session_path
      end
    end

    def post_params
      post_params = params.require(:event).permit(:start_date, :title, :duration, :description, :price, :location, :picture)
    end

    def is_admin?
    @event = Event.find(params[:id])
      unless @event.event_admin == current_user
        redirect_to @event, danger: "Pas touche, c'est pas ton event !"
      end
    end

    def can_subscribe?
      @event = Event.find_by(id: params[:event_id])
      if @event.users.select{ |user| user == current_user }.count == 0
        return true
      else
        redirect_to event_path(@event), danger: "Tu es déjà inscrit !"
      end
  end


end
