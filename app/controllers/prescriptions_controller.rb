class PrescriptionsController < ApplicationController

  def new
    @patient = Patient.find(params[:patient_id])
    @prescription = Prescription.new
    @medications = Medication.all
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @prescription = Prescription.new(allowed_params)
    @prescription.patient = @patient
    if @prescription.save
      flash[:notice] = "Your prescription has been created"
      redirect_to patient_path(params[:patient_id])
    else
      @medications = Medication.all
      render_error_messages(@prescription)
      render :new
    end
  end

  private

  def allowed_params
    params.fetch(:prescription, {}).permit(:medication_id, :start_date, :end_date, :dosage, :schedule)
  end

  def render_error_messages(prescription)
    # flash[:error] = []
    prescription.errors.full_messages.each do |message|
    flash[:error] = message
    end
  end

end