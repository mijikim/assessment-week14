class Prescription < ActiveRecord::Base

  validates_presence_of :dosage, :schedule

  belongs_to :medication
  belongs_to :patient

end