require "spec_helper"

describe ActorsController do

  it "should get the index" do
    get :index

    response.should be_successful
    response.should render_template("index")
  end

  it "get a new actor" do
    get :new
    response.should be_successful
  end

  describe "POST create" do
    it "should post an actor and redirect to the actor path" do
      post :create, :actor => { :name => 'Mariela', :gender => 'M' }

      response.should redirect_to(assigns[:actor])
    end

    it "should post an actor and render new template on failed save" do
      post :create, :actor => {:name => 'Marielita'}

      response.should render_template('new')
    end

    it "should pass params to actor" do
      post 'create', :actor => { :name => 'Pepe' }
      assigns[:actor].name.should == 'Pepe'
    end
  end

  it "should view an actor" do
    actor = FactoryGirl.create(:actor)

    get :show, id: actor.id

    response.should be_successful
    response.should render_template("show")
  end

  it "should edit an actor" do
    get :edit, id: FactoryGirl.create(:actor).id

    response.should be_successful

    response.should render_template("edit")
  end

  it "should update the actor" do
    actor = FactoryGirl.create(:actor, :name => "Juanito")

    put :update, id: actor.id, params: {:name => "Pedrito"}

    response.should redirect_to(actor)
  end

  it "should remove an actor" do
    actor = FactoryGirl.create(:actor, :name => "Juana")

    delete :destroy, id: actor.id

    Actor.find_by_name("Juana").should be_nil
    response.should redirect_to(actors_url)
  end
end
