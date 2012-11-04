class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index

    @events = Event.where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show

    @event = Event.find(params[:id])
    render_forbidden and return unless can_edit?
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit

      @event = Event.find(params[:id])
      render_forbidden and return unless can_edit?
    
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
                         @event.user_id = current_user.id


    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    render_forbidden and return unless can_edit?
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    render_forbidden and return unless can_edit?
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
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
end
