feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect {register_user}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome Admin, admin@admin.com')
    expect(User.first.email).to eq('admin@admin.com')
  end
end
