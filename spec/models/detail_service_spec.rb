require 'rails_helper'

RSpec.describe DetailService, type: :model do
  describe "Validations" do
    it { should validate_uniqueness_of :name}
    it { should validate_presence_of :base_price}
    it { should validate_presence_of :description}
  end
end
