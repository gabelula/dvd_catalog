require 'spec_helper'

describe Director do
  describe 'Relationships' do
    before do
      @disc = FactoryGirl.create(:disc)
      @director = FactoryGirl.create(:director, :discs => [@disc])
    end

    it 'should add discs' do

    end

    it 'should remove discs' do

    end

  end
end
