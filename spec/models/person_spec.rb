require 'spec_helper'

describe Person do
  describe 'Validations' do
    before do
      @person = Person.new
      @person.valid?
    end

    it "should require name"   do
      @person.errors[:name].should_not be_empty
    end

    it "should require gender" do
      @person.errors[:gender].should_not be_empty
    end

    it "should not accept repeated names" do
      @person.name = 'Juana'
      @person.gender = 'F'
      @person.save

      second_person = Person.new(:name => 'Juana')
      second_person.valid?

      second_person.errors.should_not be_empty
    end

  end
end
