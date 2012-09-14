class DirectorsController < ApplicationController
  # GET /Directors
  # GET /Directors.json
  def index
    @Directors = Director.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @Directors }
    end
  end

  # GET /Directors/1
  # GET /Directors/1.json
  def show
    @Director = Director.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @Director }
    end
  end

  # GET /Directors/new
  # GET /Directors/new.json
  def new
    @Director = Director.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @Director }
    end
  end

  # GET /Directors/1/edit
  def edit
    @Director = Director.find(params[:id])
  end

  # POST /Directors
  # POST /Directors.json
  def create
    @Director = Director.new(params[:Director])

    respond_to do |format|
      if @Director.save
        format.html { redirect_to @Director, notice: 'Director was successfully created.' }
        format.json { render json: @Director, status: :created, location: @Director }
      else
        format.html { render action: "new" }
        format.json { render json: @Director.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Directors/1
  # PUT /Directors/1.json
  def update
    @Director = Director.find(params[:id])

    respond_to do |format|
      if @Director.update_attributes(params[:Director])
        format.html { redirect_to @Director, notice: 'Director was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @Director.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Directors/1
  # DELETE /Directors/1.json
  def destroy
    @Director = Director.find(params[:id])
    @Director.destroy

    respond_to do |format|
      format.html { redirect_to Directors_url }
      format.json { head :no_content }
    end
  end
end
