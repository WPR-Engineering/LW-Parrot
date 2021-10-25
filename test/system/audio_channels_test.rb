require "application_system_test_case"

class AudioChannelsTest < ApplicationSystemTestCase
  setup do
    @audio_channel = audio_channels(:one)
  end

  test "visiting the index" do
    visit audio_channels_url
    assert_selector "h1", text: "Audio Channels"
  end

  test "creating a Audio channel" do
    visit audio_channels_url
    click_on "New Audio Channel"

    fill_in "Chmcastip", with: @audio_channel.chMcastIP
    fill_in "Chname", with: @audio_channel.chName
    fill_in "Chnotes", with: @audio_channel.chNotes
    fill_in "Chnumber", with: @audio_channel.chNumber
    click_on "Create Audio channel"

    assert_text "Audio channel was successfully created"
    click_on "Back"
  end

  test "updating a Audio channel" do
    visit audio_channels_url
    click_on "Edit", match: :first

    fill_in "Chmcastip", with: @audio_channel.chMcastIP
    fill_in "Chname", with: @audio_channel.chName
    fill_in "Chnotes", with: @audio_channel.chNotes
    fill_in "Chnumber", with: @audio_channel.chNumber
    click_on "Update Audio channel"

    assert_text "Audio channel was successfully updated"
    click_on "Back"
  end

  test "destroying a Audio channel" do
    visit audio_channels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Audio channel was successfully destroyed"
  end
end
