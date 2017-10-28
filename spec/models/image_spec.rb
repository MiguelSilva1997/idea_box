require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "attributes" do
    it "has a name and a url" do
      image = Image.new(name: "image", image: 'https://pbs.twimg.com/profile_images/530292596740866048/nR0ZmD3x.jpeg')

      expect(image).to respond_to(:name)
      expect(image).to respond_to(:image)
    end
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:image) }
  end
end
