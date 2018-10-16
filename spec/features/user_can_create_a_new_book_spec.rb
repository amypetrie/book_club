require 'rails_helper'

describe 'user visits book index page' do
  it 'user can create a new book' do
    visit new_book_path

    title = "test book"
    page_num = 231
    year_published = 2018
    authors = "Amy Petrie, Tim Fell"

    fill_in 'book[title]', with: title
    fill_in 'book[page_num]', with: page_num
    fill_in 'book[year_published]', with: year_published
    fill_in 'book[authors]', with: authors

    click_on "Create Book"
    
    expect(page).to have_content(title)
    expect(page).to have_content(page_num)
    expect(page).to have_content(year_published)
    expect(page).to have_content("Amy Petrie")
    expect(page).to have_content("Tim Fell")
  end
end
