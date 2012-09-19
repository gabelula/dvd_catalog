require "spec_helper"

describe MoviesController do

  render_views

  it "should get the index" do
    get :index

    response.should be_successful
    response.should render_template("index")
    response.should include("Listing movies")
  end

  it "get a new movie" do
    get :new
    response.should be_successful
  end

  describe "POST create" do
    it "should post an movie and redirect to the movie path" do
      post :create, :movie => { :name => 'Big bang movie', :summary => 'Something summary' }

      response.should redirect_to(assigns[:movie])
    end

    it "should post an movie and render new template on failed save" do
      post :create, :movie => {:name => 'Start Trek'}

      response.should render_template('new')
    end

    it "should pass params to movie" do
      post 'create', :movie => { :name => 'Ladri' }
      assigns[:movie].name.should == 'Ladri'
    end
  end

  it "should view an movie" do
    movie = FactoryGirl.create(:movie)

    get :show, id: movie.id

    response.should be_successful
    response.should render_template("show")
    response.should include(movie.name)
  end

  it "should edit an movie" do
    get :edit, id: FactoryGirl.create(:movie).id

    response.should be_successful

    response.should render_template("edit")
  end

  it "should update the movie" do
    movie = FactoryGirl.create(:movie, :name => "Star Trek I")

    put :update, id: movie.id, params: {:name => "Star Trek II"}

    response.should redirect_to(movie)
  end

  it "should remove an movie" do
    movie = FactoryGirl.create(:movie, :name => "El mundo feliz")

    delete :destroy, id: movie.id

    Movie.find_by_name("El mundo feliz").should be_nil
    response.should redirect_to(movies_url)
  end
end
