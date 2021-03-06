require 'rails_helper'

RSpec.describe 'StaticPages', :type => :feature do
  describe 'GET /static_pages' do

    subject { page }

    describe 'GET /index page' do
      before(:each) do
        visit root_path
      end

      it 'should have the title as sample app |' do
        expected_title = "#{base_title}"
        should have_title(expected_title)
      end
      it 'should load the index page and display sign up page link' do
        body = 'ScratchBox Post New Idea Help About Contact Sign in Welcome to ScratchBox Share your ideas,
                Expand your horizons For new registration, Sign up now! Existing user ?
                Sign in here This site is maintained by Tripartite Inc. @copyright 2016'
        expected_msg = "#{body}"
        should have_content(expected_msg)

      end

    end

    describe 'GET /home page' do
      let!(:user) { FactoryGirl.create(:user) }
      before(:each) do
        visit post_new_idea_path
      end
      it 'should load home page and display welcome message' do
        sign_in user
        expected_msg = 'scratch down your new idea here...'
        should have_content(expected_msg)
      end

      it 'should have title as sample app | Home' do
        expected_title = "#{base_title} New Idea"
        have_content(expected_title)
      end
    end

    describe 'GET /Help page' do

      before(:each) do
        visit help_path
      end
      it 'should load help page and display help center no' do
        expected_msg = 'This is help page for this Sample App'
        should have_content(expected_msg)
      end

      it 'should have title as sample app | Help' do
        expected_title = "#{base_title} Help"
        should have_title(expected_title)
      end
    end

    describe 'GET /about page' do
      before(:each) do
        visit about_path
      end
      it 'should load about page and display my profile' do
        expected_msg = 'This is about page'
        should have_content(expected_msg)
      end

      it 'should have title as sample app | About' do
        expected_title = "#{base_title} About"
        should have_title(expected_title)
      end
    end

    describe 'GET /contact page' do
      before(:each) do
        visit contact_path
      end
      it 'should load contact page and display contact info' do
        expected_msg = 'This is contact page'
        should have_content(expected_msg)
      end
      it 'should have title as sample app | Contact' do
        expected_title = "#{base_title} Contact"
        should have_title(expected_title)
      end

    end

  end
end

