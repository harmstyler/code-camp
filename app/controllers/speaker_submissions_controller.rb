class SpeakerSubmissionsController < ApplicationController

  # GET /submit
  def new
    @speaker_submission = SpeakerSubmission.new
  end

  # POST /submit
  # POST /submit.json
  def create
    @speaker_submission = SpeakerSubmission.new(subscriber_params)

    respond_to do |format|
      if @speaker_submission.save
        format.html { redirect_to root_path, notice: 'You have been successfully added to the subscriber list.' }
        format.json { render action: 'show', status: :created, location: @speaker_submission }
      else
        format.html { render action: 'new' }
        format.json { render json: @speaker_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriber
      @speaker_submission = SpeakerSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      params[:speaker_submission].permit(:name, :email, :title, :abstract, :speaker_bio)
    end
end
