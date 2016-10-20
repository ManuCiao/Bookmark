feature 'adding tags to links' do
  scenario 'adding a single tag to a single link' do

      visit "/links/new"
      fill_in :url, with: 'www.bbc.co.uk'
      fill_in :title, with: 'BBC'
      fill_in :tags, with: 'News'
      click_button 'Add Link'
      link = Link.first
      expect(link.tags.map(&:tag)).to include('News')
  end
end

feature 'added tags can be filtered' do
  scenario 'tags can be filtered and are displayed on routed page' do
    add_tag_and_redirect_to_homepage
    # link = Link.all
    # tag = Tag.first(tag: "News")
    expect(page).to have_content ('www.bbc.co.uk')
    expect(page).not_to have_content ("www.facebook.com")
  end
end
