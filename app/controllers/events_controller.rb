class EventsController < ApplicationController

  before_filter do
    @events = Event.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
    @event = Event.new
  end

  before_filter :find_an_item, :only => [:edit, :update, :destroy]

  def index
   # @events = Event.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @event = Event.find(params[:id])
    render_forbidden and return unless can_edit?
  end

  def edit
    #@event = Event.all
      @event = Event.find(params[:id])
      render_forbidden and return unless can_edit?    
  end

  def create
    @event = Event.new(params[:event])
    @event.user_id = current_user.id
      if @event.save
        flash[:notice] = "Successfully created event."
        @events = Event.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
    end
  end

  def update
    render_forbidden and return unless can_edit?
      if @event.update_attributes(params[:event])
        flash[:notice] = "Successfully updated event."
      end
      @events = Event.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
      render :action => 'create'
  end

  def destroy
    @event.destroy
    render_forbidden and return unless can_edit?
    flash[:notice] = "Successfully destroyed event."
    @events = Event.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)
  end

  private

  def can_edit?
    current_user.id == @event.user_id
  end

  def render_forbidden
    respond_to do |format|
      format.html {redirect_to events_url, notice: 'It\'s not your page'}
      #format.html { render :action => "errors/forbidden", :status => 403 }
     
    end
    true
  end

  protected 
  def find_an_item
    @event = Event.find(params[:id])
  end
end
