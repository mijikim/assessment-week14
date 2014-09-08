class PrescriptionsController < ApplicationController

  def new
    @patient = Patient.find(params[:patient_id])
    @prescription = Prescription.new
    @medications = Medication.all
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @prescription = Prescription.new(params.fetch(:prescription, {}).permit(:medication_id, :start_date, :end_date, :dosage, :schedule))
    @prescription.patient = @patient
    if @prescription.save
      flash[:notice] = "Prescription was created successfully!"
      redirect_to patient_path(params[:patient_id])
    else
      flash[:error] = @prescription.errors.full_messages.each do |message|
        message
      end
      render :new
    end
  end

end