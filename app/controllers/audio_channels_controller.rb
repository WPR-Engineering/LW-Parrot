class AudioChannelsController < ApplicationController
  before_action :set_audio_channel, only: %i[ show edit update destroy ]

  # GET /audio_channels or /audio_channels.json
  def index
    @audio_channels = AudioChannel.all
  end

  # GET /audio_channels/1 or /audio_channels/1.json
  def show
  end

  # GET /audio_channels/new
  def new
    @audio_channel = AudioChannel.new
  end

  # GET /audio_channels/1/edit
  def edit

  end

  # POST /audio_channels or /audio_channels.json
  def create
    @audio_channel = AudioChannel.new(audio_channel_params)
    enteredNumber = @audio_channel.chNumber
    #create_mcast_ip(enteredNumber)
    @audio_channel.update(chMcastIP: create_mcast_ip(enteredNumber))

    respond_to do |format|
      if @audio_channel.save
        format.html { redirect_to @audio_channel, notice: "Audio channel was successfully created." }
        format.json { render :show, status: :created, location: @audio_channel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @audio_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audio_channels/1 or /audio_channels/1.json
  def update

    respond_to do |format|
      if @audio_channel.update(audio_channel_params)
        enteredNumber = @audio_channel.chNumber
        @audio_channel.update(chMcastIP: create_mcast_ip(enteredNumber))
        format.html { redirect_to @audio_channel, notice: "Audio channel was successfully updated." }
        format.json { render :show, status: :ok, location: @audio_channel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @audio_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_channels/1 or /audio_channels/1.json
  def destroy
    @audio_channel.destroy
    respond_to do |format|
      format.html { redirect_to audio_channels_url, notice: "Audio channel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_channel
      @audio_channel = AudioChannel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def audio_channel_params
      params.require(:audio_channel).permit(:chNumber, :chName, :chMcastIP, :chNotes)
    end

    # Create the multicast IP from the channel number.
    def create_mcast_ip(channelNumber)
      #TODO add math to create multicast IP
      #generate octect 3 in the IP address
      oct3 = (channelNumber / 256).floor
      #generate octect 4 in the IP address
      oct4 = channelNumber - oct3 * 256
      #create the entire IP address
      mcastIP = "239.192.#{oct3}.#{oct4}"
      return mcastIP
    end
end
