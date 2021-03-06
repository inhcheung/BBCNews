When(/^I click on 'Sign In'$/) do
  site.my_bbc.sign_in.click
end

Then(/^I should arrive to the 'Sign in \- BBC iD' page$/) do
  #expect(site.page_url).to match(/https\:\/\/ssl.bbc.co.uk\/id\/signin/)
  expect(site.signin_page.account_header("Sign in").present?).to eq(true)
end

And(/^when I click on the link on 'Don't have a BBC iD\? Please register\.'$/) do
  site.signin_page.register_link.when_present.click
end

Then(/^I should arrive to the 'Register \- BBC iD' page$/) do
  #expect(site.page_url).to match(/https\:\/\/ssl.bbc.co.uk\/id\/register/)
  expect(site.signin_page.account_header("Register").present?).to eq(true)
end



When(/^I type that email address into the Email field$/) do
  # @page.username("bbcid_email").click
  @page.username("bbcid_email").set(ENV['EMAIL'])
  #@page.tab_out
end

And(/^I type a password which is valid ie more than 6 characters : '(.*)'$/) do |password|
  ENV['PW']= password
  @page.password("bbcid_createpassword").set(ENV['PW'])
  # @page.tab_out
end

And(/^retype it in 'Confirm password'$/) do
  @page.password("bbcid_confirmpassword").set(ENV['PW'])
  # @page.tab_out
end

And(/^press 'Register'$/) do
  #Watir::Wait.while{@page.register(' disabled').present?}
  Watir::Wait.until {@page.register.present?}
  @page.register.when_present.click
end

Then(/^I should be taken to the (.*) page$/) do |word|
  expect(@page.text_shown).to include(word)
  expect(@page.text_shown).to include('You’re registered as:')
  expect(@page.text_shown).to include(ENV['EMAIL'])
end

And(/^I should recieve an email$/) do
  ENV['REG_STATUS'] ||= "registered"
end

And(/^I should be able to log out$/) do
  @page.your_account.when_present.click
  sleep(2)
  @page.sign_out.when_present.click
  Watir::Wait.until {@page.sign_out_confirmation.present?}
  #binding.pry
end



Then(/^a red exclamation mark shows on the field$/) do
end

And(/^a validation message should appear: 'This email address is already registered'$/) do
  @page.tab_out
  Watir::Wait.until {@page.already_exists_message.exists?}
  expect(@page.already_exists_message).to be_present
end

Then(/^a green tick appears on the field$/) do
end

When(/^I type in the email field \- '(.*)', which (.*)$/) do |email, test|
  #@page.username("bbcid_email").click
  @page.username("bbcid_email").set(email)
end

Then(/^an orange exclamation mark shows on the field$/) do
end

And(/^there's a validation message for (email|password) showing \- '(.*)'$/) do |field, validation_message|
  @page.tab_out
  case field
    when 'email'
      Watir::Wait.until {@page.email_address_invalid.exists?}
      expect(@page.email_address_invalid).to be_present
    when 'password'
      case validation_message
        when 'This is too short'
          Watir::Wait.until {@page.password_too_short_message.exists?}
          expect(@page.password_too_short_message).to be_present
        when 'This is too long'
          Watir::Wait.until {@page.password_too_long_message.exists?}
          expect(@page.password_too_long_message).to be_present
      end

  end
end

When(/^I type in the New password field \- '(.*)', which (.*)$/) do |password, test|
  @page.password("bbcid_createpassword").set(password)
end


Given(/^I type email '(.*)' into Email field$/) do |email|
  @page.username("bbcid_email").set(email)
end

When(/^I type in the (New|Confirmation) password field \- '(.*)'$/) do |which, new_password|
  case which
    when 'New'
      id = "bbcid_createpassword"
    when 'Confirmation'
      id = "bbcid_confirmpassword"
  end

  if new_password == ''
    @page.password(id).set(nil)
  else
    @page.password(id).set(new_password)
  end
end


And(/^The 'Register' button is disabled$/) do
  expect(@page.register(" disabled")).to be_present
end

When(/^I type in the New password field \- '(.*)' which is (.*)$/) do |new_password, test|

end

And(/^I type in the Confirmation password field \- '(.*)' which does not match$/) do |confirm_password|

end

But(/^since the password format validation messages are a priority over the mismatch messages$/) do

end

Then(/^the format validation message should show (.*) instead$/) do |validation_message|

end

Given(/^I have landed on the 'BBC iD Sign In' page$/) do

end

When(/^I click on 'Cancel'$/) do

end

Then(/^I should be taken back to the iPlayer homepage$/) do

end

And(/^the 'sign in' button remains as 'sign in'$/) do

end

Given(/^I have removed both Facebook and Google links to my account$/) do

end

And(/^I am on 'Your Details' page$/) do

end

When(/^I click on 'Delete your BBC iD'$/) do

end

And(/^confirm deletion on the next page$/) do

end


And(/^no label hint shows$/) do
  expect(@page.already_exists_message).not_to be_present
end

Then(/^there should be (\d+) validation messages one for the email and one for the password$/) do |arg|
  #Watir::Wait.until {@page.email_address_invalid.exists?}
  sleep(5)
  expect(@page.email_address_invalid.present?).to eq(true)
  expect(@page.password_too_short_message.present?).to eq(true)
end

And(/^wait for the (\d+) green ticks to appear$/) do |arg|
  Watir::Wait.until{@page.count_green_ticks == 3}
end