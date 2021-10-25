require "test_helper"

class AudioChannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audio_channel = audio_channels(:one)
  end

  test "should get index" do
    get audio_channels_url
    assert_response :success
  end

  test "should get new" do
    get new_audio_channel_url
    assert_response :success
  end

  test "should create audio_channel" do
    assert_difference('AudioChannel.count') do
      post audio_channels_url, params: { audio_channel: { chMcastIP: @audio_channel.chMcastIP, chName: @audio_channel.chName, chNotes: @audio_channel.chNotes, chNumber: @audio_channel.chNumber } }
    end

    assert_redirected_to audio_channel_url(AudioChannel.last)
  end

  test "should show audio_channel" do
    get audio_channel_url(@audio_channel)
    assert_response :success
  end

  test "should get edit" do
    get edit_audio_channel_url(@audio_channel)
    assert_response :success
  end

  test "should update audio_channel" do
    patch audio_channel_url(@audio_channel), params: { audio_channel: { chMcastIP: @audio_channel.chMcastIP, chName: @audio_channel.chName, chNotes: @audio_channel.chNotes, chNumber: @audio_channel.chNumber } }
    assert_redirected_to audio_channel_url(@audio_channel)
  end

  test "should destroy audio_channel" do
    assert_difference('AudioChannel.count', -1) do
      delete audio_channel_url(@audio_channel)
    end

    assert_redirected_to audio_channels_url
  end
end
