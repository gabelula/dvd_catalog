class ActorsController < ApplicationController
  # GET /actors
  # GET /actors.json
  def index
    @actors = Actor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @actors }
    end
  end

  # GET /actors/1
  # GET /actors/1.json
  def show
    @Actor = Actor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @Actor }
    end
  end

  # GET /actors/new
  # GET /actors/new.json
  def new
    @Actor = Actor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @Actor }
    end
  end

  # GET /actors/1/edit
  def edit
    @Actor = Actor.find(params[:id])
  end

  # POST /actors
  # POST /actors.json
  def create
    @Actor = Actor.new(params[:Actor])

    respond_to do |format|
      if @Actor.save
        format.html { redirect_to @Actor, notice: 'Actor was successfully created.' }
        format.json { render json: @Actor, status: :created, location: @Actor }
      else
        format.html { render action: "new" }
        format.json { render json: @Actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /actors/1
  # PUT /actors/1.json
  def update
    @Actor = Actor.find(params[:id])

    respond_to do |format|
      if @Actor.update_attributes(params[:Actor])
        format.html { redirect_to @Actor, notice: 'Actor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @Actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actors/1
  # DELETE /actors/1.json
  def destroy
    @Actor = Actor.find(params[:id])
    @Actor.destroy

    respond_to do |format|
      format.html { redirect_to actors_url }
      format.json { head :no_content }
    end
  end
end
