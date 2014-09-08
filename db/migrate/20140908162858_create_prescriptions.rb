class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.belongs_to :medication, null: false
      t.belongs_to :patient, null: false
      t.belongs_to :user, null: false
      t.string :dosage, null: false
      t.string :schedule, null: false
      t.date :start_date
      t.date :end_date
    end
  end
end
