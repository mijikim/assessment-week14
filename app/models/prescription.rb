class Prescription < ActiveRecord::Base

  validates_presence_of :dosage, :schedule
  validates_format_of :dosage, :with => /\A[1-9]/, :message => " must start with a number"

  belongs_to :medication
  belongs_to :patient
  belongs_to :user

end