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

end
