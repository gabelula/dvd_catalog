require 'spec_helper'

describe DirectorsController do

  it "returns http success" do
    get 'index'

    response.should be_successful
    response.should render_template("index")
  end

  it "returns http success" do
    get 'create'
    response.should be_success
  end

  it "returns http success" do
    get 'new'
    response.should be_successful
    response.should render_template("new")
  end

  describe "POST create" do
    it "should post an director and redirect to the director path" do
      post :create, :director => { :name => 'Mariela', :gender => 'M' }

      response.should redirect_to(assigns[:director])
    end

    it "should post an director and render new template on failed save" do
      post :create, :director => {:name => 'Marielita'}

      response.should render_template('new')
    end

    it "should pass params to director" do
      post 'create', :director => { :name => 'Pepe' }
      assigns[:director].name.should == 'Pepe'
    end
  end

  it "should view an director" do
    director = FactoryGirl.create(:director)

    get :show, id: director.id

    response.should be_successful
    response.should render_template("show")
  end

  it "should edit an director" do
    get :edit, id: FactoryGirl.create(:director).id

    response.should be_successful

    response.should render_template("edit")
  end

  it "should update the director" do
    director = FactoryGirl.create(:director, :name => "Juanito")

    put :update, id: director.id, params: {:name => "Pedrito"}

    response.should redirect_to(director)
  end

  it "should remove an director" do
    director = FactoryGirl.create(:director, :name => "Juana")

    delete :destroy, id: director.id

    Director.find_by_name("Juana").should be_nil
    response.should redirect_to(directors_url)
  end
end
