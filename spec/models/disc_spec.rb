require 'spec_helper'

describe Disc do
  describe 'Validations' do
    before do
      @disc = Disc.new
      @disc.valid?
    end

    it "should require name"    do
      @disc.errors[:name].should_not be_empty
    end
    it "should require summary" do
      @disc.errors[:summary].should_not be_empty
    end

    it "should not accept repeated names" do
       @disc.name = 'Juana'
       @disc.release_date = Date.today
       @disc.summary = 'This is a summary'
       @disc.save

       second_disc = Disc.new(:name => 'Juana')
       second_disc.valid?

       second_disc.errors.should_not be_empty
     end

    it "should not accept future release dates" do
        @disc.release_date = Date.today + 30
        @disc.valid?

        @disc.errors[:release_date].should_not be_empty
    end

  end
end
