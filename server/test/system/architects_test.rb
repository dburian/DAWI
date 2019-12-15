require "application_system_test_case"

class ArchitectsTest < ApplicationSystemTestCase
  setup do
    @architect = architects(:one)
  end

  test "visiting the index" do
    visit architects_url
    assert_selector "h1", text: "Architects"
  end

  test "creating a Architect" do
    visit architects_url
    click_on "New Architect"

    fill_in "Desc", with: @architect.desc
    fill_in "Name", with: @architect.name
    fill_in "Position", with: @architect.position
    click_on "Create Architect"

    assert_text "Architect was successfully created"
    click_on "Back"
  end

  test "updating a Architect" do
    visit architects_url
    click_on "Edit", match: :first

    fill_in "Desc", with: @architect.desc
    fill_in "Name", with: @architect.name
    fill_in "Position", with: @architect.position
    click_on "Update Architect"

    assert_text "Architect was successfully updated"
    click_on "Back"
  end

  test "destroying a Architect" do
    visit architects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Architect was successfully destroyed"
  end
end
