require 'spec_helper'

describe Person do
  describe 'Validations' do
    before do
      @person = Person.new
      @person.valid?
    end

    context "Name and Gender not empty" do
      it { @person.errors[:name].should_not be_empty }
      it { @person.errors[:gender].should_not be_empty }
    end

    context "Uniqueness of name" do
      before do
        @person.name = 'Juana'
        @person.gender = 'F'
        @person.save
      end

      it "should not accept repeated names" do
        second_person = Person.new(:name => 'Juana')
        second_person.valid?

        second_person.errors.should_not be_empty
      end
    end

  end
end
