require 'spec_helper'

describe Director do
  describe 'Relationships' do
    before(:each) do
      @movie    = FactoryGirl.create(:movie)
      @director = FactoryGirl.create(:director)

      @director.movies << @movie
    end

    it "should add the relationships" do
      expect(@director.movies).to eq([@movie])
      expect(@movie.director).to eq(@director)
    end

    it 'should remove movies' do
      @director.movies.delete(@movie)

      @movie.reload

      expect(@director.movies).to be_empty
      expect(@movie.director).to be_nil
    end

  end
end
