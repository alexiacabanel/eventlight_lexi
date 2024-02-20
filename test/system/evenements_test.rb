require "application_system_test_case"

class EvenementsTest < ApplicationSystemTestCase
  setup do
    @evenement = evenements(:one)
  end

  test "visiting the index" do
    visit evenements_url
    assert_selector "h1", text: "Evenements"
  end

  test "should create evenement" do
    visit evenements_url
    click_on "New evenement"

    click_on "Create Evenement"

    assert_text "Evenement was successfully created"
    click_on "Back"
  end

  test "should update Evenement" do
    visit evenement_url(@evenement)
    click_on "Edit this evenement", match: :first

    click_on "Update Evenement"

    assert_text "Evenement was successfully updated"
    click_on "Back"
  end

  test "should destroy Evenement" do
    visit evenement_url(@evenement)
    click_on "Destroy this evenement", match: :first

    assert_text "Evenement was successfully destroyed"
  end
end
