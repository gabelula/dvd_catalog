require 'spec_helper'

describe Person do
  describe 'Validations' do
    subject do
      Person.new
    end

    it "should require name"   do
      subject.should_not be_valid
      subject.errors[:name].should include("can't be blank")
    end

    it "should require gender" do
      subject.should_not be_valid
      subject.errors[:gender].should include("can't be blank")
    end

    it "should have a valid gender" do
      subject.update_attributes( :name => 'Mariana', :gender => 'any')

      subject.should_not be_valid
      subject.errors[:gender].should include("must be one of Masculine, Femenine or Other")
    end

    it "should not accept repeated names" do
      subject.update_attributes( :name => 'Juana',
                                 :gender => 'F')

      subject.should be_valid

      second_person = Person.new(:name => 'Juana')
      second_person.valid?

      second_person.errors.should_not be_empty
    end

  end
end
