require 'rails_helper'
require 'capybara/rails'

feature "Patients" do

  scenario "User sees all patients" do
    user = create_user
    patient = create_patient
    login(user)

    expect(page).to have_content(patient.first_name, patient.last_name)
  end

  scenario "User can see individual patient" do
    user = create_user
    patient = create_patient
    login(user)
    click_link "Finn Hudson"

    expect(page).to have_content(patient.first_name, patient.last_name)

  end

end