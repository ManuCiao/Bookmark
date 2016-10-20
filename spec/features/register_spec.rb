feature "User can register to site" do
  scenario "new user can enter email and password to sign up" do
  register_user
  expect(user.map(&:username)).to include('admin')
  end
end

feature "New user is welcomed on registration" do
  scenario "Welcome page rendered after submit" do
  register_user
  expect(page).to have_content("Welcome")
  end
end
