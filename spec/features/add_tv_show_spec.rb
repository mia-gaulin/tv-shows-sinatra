require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.

  scenario "successfully add a new show" do
    visit '/television_shows'
    click_link "Add New Show"

    fill_in "Title", with: "Sailor Moon"
    fill_in "Network", with: "ANN"
    fill_in "Starting Year", with: 1995
    fill_in "Ending Year", with: 2000
    select "Fantasy", :from => "genre"
    fill_in "Synopsis", with: "Fighting evil by moonlight"

    click_button "Add TV Show"

    expect(page).to have_content("Sailor Moon (ANN)")
  end

  scenario "fail to add a show with invalid information" do
    visit '/television_shows'
    click_link "Add New Show"

    # fill_in "Title", with: "Sailor Moon"
    fill_in "Network", with: "ANN"
    fill_in "Starting Year", with: 1995
    fill_in "Ending Year", with: 2000
    select "Fantasy", :from => "genre"
    fill_in "Synopsis", with: "Fighting evil by moonlight"

    click_button "Add TV Show"

    expect(page).to have_content("Please enter all required information.")
  end
end
