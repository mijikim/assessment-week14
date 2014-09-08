class Prescription < ActiveRecord::Base

  belongs_to :medication
  belongs_to :patient

  validates_presence_of :medication, :patient, :dosage, :schedule

end