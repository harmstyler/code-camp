class SubscribersController < ApplicationController

  def index
    @subscribers = Subscriber.all
  end
  # GET /subscribers/new
  def new
    @subscriber = Subscriber.new
  end

  # POST /subscribers
  # POST /subscribers.json
  def create
    @subscriber = Subscriber.new(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        SubscriberMailer.thanks_email(@subscriber).deliver
        format.html { redirect_to root_path, notice: 'You have been successfully added to the subscriber list.' }
        format.json { render action: 'show', status: :created, location: @subscriber }
      else
        format.html { render action: 'new' }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      params[:subscriber].permit(:name, :email)
    end
end
