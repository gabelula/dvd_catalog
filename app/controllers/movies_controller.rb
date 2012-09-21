class MoviesController < ApplicationController
  # GET /Movies
  # GET /Movies.json
  def index
    begin
      @movies = Movie.search_for(params[:search], :order => params[:order]).all(:include => :actor)
    rescue => e
      flash[:error] = e.to_s
      @movies = Movie.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movies }
    end
  end

  def auto_complete_search
    begin
      @movies = Movie.complete_for(params[:search])
    rescue ScopedSearch::QueryNotSupported => e
      @movies = [{:error => e.to_s }]
    end

#   respond_to do |format|
#      format.html
#      format.json { render json: @movies }
#    end
  end

  # GET /Movies/1
  # GET /Movies/1.json
  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /Movies/new
  # GET /Movies/new.json
  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /Movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /Movies
  # POST /Movies.json
  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Movies/1
  # PUT /Movies/1.json
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Movies/1
  # DELETE /Movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end
end
