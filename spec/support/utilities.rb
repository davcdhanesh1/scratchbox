def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
  else
    visit signin_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_button 'Sign In'
  end
end

def base_title
  'ScratchBox |'
end

def header
    'Sample App Post New Idea Help About Contact Sign in'
end

def footer
  'This site is maintained by Tripartite Inc. @copyright 2016'
end

def error_selector
  'div.alert.alert-error'
end