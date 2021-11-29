# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Footer", type: :feature do
  describe "Social Media section" do
    it "is titled Social Media" do
      visit root_path

      within ".footer" do
        expect(page).to have_css("h1", text: "Social Media")
      end
    end

    describe "Social Media Icons" do
      before do
        visit root_path
      end

      it "has a icon to Facebook" do
        within ".social_media_outlets" do
          expect(page).to have_css("img", id: "facebook")
        end
      end

      it "has a icon to Instagram" do
        within ".social_media_outlets" do
          expect(page).to have_css("img", id: "instagram")
        end
      end

      it "has a icon to Twitter" do
        within ".social_media_outlets" do
          expect(page).to have_css("img", id: "twitter")
        end
      end

      it "has a icon to Linked-In" do
        within ".social_media_outlets" do
          expect(page).to have_css("img", id: "linked-in")
        end
      end

      it "has a icon to Youtube" do
        within ".social_media_outlets" do
          expect(page).to have_css("img", id: "youtube")
        end
      end

      it "has a icon to Yelp" do
        within ".social_media_outlets" do
          expect(page).to have_css("img", id: "yelp")
        end
      end
    end

    # xdescribe "Social Media Links" do
    #   let (:driver) { Capybara.current_driver = :selenium_chrome}
    #   def login(path, username, password)
    #     visit path
    #
    #     fill_in "username", with: username
    #     fill_in "password", with: password
    #
    #     click_on "Log In"
    #   end
    #   before do
    #     driver
    #
    #     visit root_path
    #   end
    #
    #   it "has a link to Facebook" do
    #     within ".social_media_outlets" do
    #       facebook = "https://www.facebook.com/TruTouchAuto/"
    #
    #       click_on "Facebook"
    #
    #       expect(page).to have_current_path(facebook, ignore_query: true)
    #     end
    #   end
    #
    #   it "has a link to Instagram" do
    #     insta_login = "https://www.instagram.com/accounts/login/"
    #     current_path = login(insta_login, ENV["intsa_username"], ENV["intsa_password"])
    #     visit root_path
    #     within ".social_media_outlets" do
    #       tt_insta = "https://www.instagram.com/trutouchauto/"
    #
    #       click_on "Instagram"
    #
    #       current_path.fill_in "username", with: username
    #       current_path.fill_in "password", with: password
    #
    #       current_path.click_on "Log In"
    #
    #       expect(page).to have_current_path(tt_insta, ignore_query: true)
    #     end
    #   end
    #
    #   it "has a link to Twitter" do
    #     within ".social_media_outlets" do
    #       yelp = "https://twitter.com/touch_tru"
    #
    #       click_on "Twitter"
    #
    #       expect(page).to have_current_path(yelp, ignore_query: true)
    #     end
    #   end
    #
    #   # xit "has a link to Linked-In" do
    #   #   within ".social_media_outlets" do
    #   #     linked_in = "https://www.linkedin.com/company/trutouch-auto/"
    #   #
    #   #     click_on "Linked-In"
    #   #
    #   #     # if current_path == "https://www.instagram.com/accounts/login/"
    #   #     #   fill_in "Phone number, username, or email", with: ENV["intsa_username"]
    #   #     #   fill_in "Password", with: ENV["intsa_password"]
    #   #     #
    #   #     #   click_on "Log In"
    #   #     # end
    #   #
    #   #     expect(page).to have_current_path(linked_in, ignore_query: true)
    #   #   end
    #   # end
    #
    #   it "has a link to Youtube" do
    #     within ".social_media_outlets" do
    #       youtube = "https://www.youtube.com/channel/UCNpURcdBeS9ZMCiDYhFZAjg/videos"
    #
    #       click_on "Youtube"
    #
    #       expect(page).to have_current_path(youtube, ignore_query: true)
    #     end
    #   end
    #
    #   it "has a link to Yelp" do
    #     within ".social_media_outlets" do
    #       yelp = "https://www.yelp.com/biz/trutouch-denver"
    #
    #       click_on "Yelp"
    #
    #       expect(page).to have_current_path(yelp, ignore_query: true)
    #     end
    #   end
    # end
  end

  describe "Copyrights" do
    it "has a section with TruTouch Copyrights" do
      visit root_path

      within ".copyrights" do
        expect(page).to have_css("span", text: "Copyright © 2018 TruTouch - All Rights Reserved.")
      end
    end
  end
end
