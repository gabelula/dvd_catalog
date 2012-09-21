require 'spec_helper'

describe Actor do
  describe 'Relationships' do
    before(:each) do
      Movie.any_instance.stub('get_amazon_info'){'got_link'}

      @movie = FactoryGirl.create(:movie)
      @actor = FactoryGirl.create(:actor)
      @actor.movies << @movie
    end

    it "should add the relationships" do
      expect(@actor.movies).to eq([@movie])
      expect(@movie.actors).to eq([@actor])
    end

    it "should remove the movie association  when removing the actor" do
      @actor.movies.delete(@movie)

      expect(@actor.movies).to be_empty
      expect(@movie.actors).to be_empty
   end
end
end
