require 'spec_helper'

describe Movie do
  describe 'Validations' do
    subject do
      Movie.new
    end

    it "should require name"    do
      subject.should_not be_valid
      subject.errors[:name].should include("can't be blank")
    end

    it "should require summary" do
      subject.should_not be_valid
      subject.errors[:summary].should include("can't be blank")
    end

    it "should not accept repeated names" do
      subject.update_attributes( :name => 'Juana',
                                 :release_date => Date.today,
                                 :summary => 'This is a summary')

      subject.should be_valid

      second_movie = Movie.new(:name => 'Juana')

      second_movie.should_not be_valid
      second_movie.errors.should_not be_empty
     end

    it "should not accept future release dates" do
      subject.update_attributes( :release_date => Date.today + 30)
      subject.should_not be_valid

      subject.errors[:release_date].should_not be_empty
    end

  end

  describe "Attributes accesibles" do
    it "should accept name, release_date, summary, asin, director, roles_attributes, actors_attributes" do
      director = FactoryGirl.create(:director)

      movie = Movie.new(:name => "John", :release_date => Date.today, :summary => "This is the summary", :asin => "12345", :director => director)

      movie.name.should eql("John")
      movie.release_date.should eql(Date.today)
      movie.summary.should eql("This is the summary")
      movie.asin.should eql("12345")
      movie.director.should eql(director)
    end
  end

  describe "Search scope" do
    before do
      movie1 = FactoryGirl.create(:movie, :name => "El nombre de la rosa")
      movie2 = FactoryGirl.create(:movie, :name => "Un tren llamado deseo")
      movie3 = FactoryGirl.create(:movie, :name => "Otro tren", :director => FactoryGirl.create(:director, :name => 'Almodovar'))
      movie2.actors << FactoryGirl.create(:actor, :name => "Williams")
    end

    it "should find the string we are looking for" do
      Movie.search_for('nombre').first.name.should eql("El nombre de la rosa")
    end

    it "should find all the movies with that string" do
      Movie.search_for('tren').count.should eql(2)
    end

   pending "should find directors" do
      found_movies = Movie.search_for('Almodovar')

      found_movies.count.should eql(1)
      found_movies.first.name.should eql("Otro tren")
    end

    it "should find actors" do
      Movie.search_for("Williams").first.name.should eql("Un tren llamado deseo")
    end
  end

end
