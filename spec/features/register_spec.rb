feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect {register_user}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome Admin, admin@admin.com')
    expect(User.first.email).to eq('admin@admin.com')
  end
end

feature 'User sign up' do
  scenario 'Mismatching password' do
    expect{ sign_up(password_confirmation: 'broom')}.not_to change(User, :count)
    expect(current_path).to eq('/add_user_data')
    expect(page).to have_content 'Password and Verify Password are not matching!'
  end
end
