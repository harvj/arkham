require "test_helper"

class EncounterPageTest < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome

  test "the encounter page loads in a browser" do
    Expansion.create!(name: "Base game", box_type: "other", can_visit: false)
    visit root_path

    assert_selector "h1", text: "Arkham Encounter"
  end
end
