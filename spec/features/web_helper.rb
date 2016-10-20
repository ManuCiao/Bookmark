def add_tag_and_redirect_to_homepage
  visit "/links/new"
  fill_in :url, with: 'www.bbc.co.uk'
  fill_in :title, with: 'BBC'
  fill_in :tags, with: 'News'
  click_button 'Add Link'
  visit "/links/new"
  fill_in :url, with: 'www.facebook.com'
  fill_in :title, with: 'Facebook'
  fill_in :tags, with: 'social'
  click_button 'Add Link'
  fill_in :filter, with: 'News'
  click_button 'Filter'
end


def multiple_tags
  visit "/links/new"
  fill_in :url, with: 'www.bbc.co.uk'
  fill_in :title, with: 'BBC'
  fill_in :tags, with: 'News World_News'
  click_button 'Add Link'
  visit "/links/new"
  fill_in :url, with: 'www.facebook.com'
  fill_in :title, with: 'Facebook'
  fill_in :tags, with: 'social media'
  click_button 'Add Link'
end
