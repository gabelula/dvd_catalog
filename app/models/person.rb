class Person < ActiveRecord::Base
  attr_accessible :birth_date, :gender, :name

  validates :name, :gender, :presence => true
  validates_uniqueness_of :name
  validate :gender_is_valid

  VALID_GENDERS = {'M' => 'Male', 'F' => 'Female', 'O' => 'Other' }

  def gender=(g)
    if ["m", "M", "male", "MALE", "Male"].include?(g)
      g = "M"
    elsif ["f", "F", "female", "FEMALE", "Female"].include?(g)
      g = "F"
    elsif ["o", "O", "other", "OTHER", "Other"].include?(g)
      g = "O"
    end
    write_attribute(:gender, g)
  end

  def gender_humanize
    return VALID_GENDERS[gender]
  end
  private

  def gender_is_valid
    errors.add(:gender, "%{attribute} must be one of Masculine, Femenine or Other") unless [nil, "", "M", "F", "O"].include?(gender)
  end
end
