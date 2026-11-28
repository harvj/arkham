require "test_helper"

class EncounterPageTest < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome

  test "the encounter page loads in a browser" do
    visit root_path

    assert_selector "h1", text: "Arkham Encounter"
  end
end
