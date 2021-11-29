# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Products Used", type: :feature do
  before do
    visit products_used_path
  end

  describe "3M Certified Tint and Clearbra Section" do
    it "has an image of 3M Certified" do
      within "#3m_tint" do
        expect(page).to have_css("img", id: "3MCI")
      end
    end

    it "has an h3 of 3M Certified" do
      within "#3m_tint" do
        expect(page).to have_css("h3", text: "3M Certified Tint and Clearbra Installer")
      end
    end

    it "has an ordered list of 3M tint descriptions" do
      within "#3mt" do
        expect(page).to have_css("ol/li", text: "Increase your privacy by blocking 95% of visible light")
      end
    end

    it "has an ordered list of 3M clearbra descriptions" do
      within "#3mcb" do
        expect(page).to have_css("ol/li", text: "It protects paint against chips, scratches, stands and the elements")
      end
    end
  end

  describe "Lexen Tint Section" do
    it "has an image of Lexen brand" do
      within "#lexen_tint" do
        expect(page).to have_css("img", id: "lexenCI")
      end
    end

    it "has an h3 of Lexen Certified Installer" do
      within "#lt" do
        expect(page).to have_css("h3", text: "Only approved Lexen Tint Installer within a 30 Mile Radius")
      end
    end

    it "has an ordered list of Lexen tint descriptions" do
      within "#lt" do
        expect(page).to have_css("ol/li", text: "Lifetime warranty")
      end
    end
  end

  describe "Adams Polish Section" do
    it "has an image of Adams Polish" do
      expect(page).to have_css("img", id: "adams_polish_img")
    end

    it "has an h3 of Detail Products by Adams" do
      within "#adams_detail" do
        expect(page).to have_css("h3", text: "Detail Products by Adams")
      end
    end

    it "has an ordered list of 3M tint descriptions" do
      within "#adams_detail" do
        expect(page).to have_css("ol/li",
                                 text: "The ultra foam shampoo used to get all the dirt and grim off")
      end
    end

    it "has an h3 of Ceramic Paint Protective Coat" do
      within "#adams_ceramic" do
        expect(page).to have_css("h3", text: "Ceramic Paint Protective Coat")
      end
    end

    it "has an ordered list of 3M clearbra descriptions" do
      within "#adams_ceramic" do
        expect(page).to have_css("ol/li", text: "Last from 2 to 5 years depending on the package")
      end
    end
  end
end
