require 'rails_helper'

describe ImageIdea do
  describe "relationships " do
    it "should respond to image" do
      image = Image.new(name: "image", image: 'https://pbs.twimg.com/profile_images/530292596740866048/nR0ZmD3x.jpeg')
      image_idea = ImageIdea.new(image_id: image, idea_id: 1)
      expect(image_idea).to respond_to(:image_id)
    end

    it "should respond to idea" do
      image = Image.new(name: "image", image: 'https://pbs.twimg.com/profile_images/530292596740866048/nR0ZmD3x.jpeg')
      image_idea = ImageIdea.new(image_id: image, idea_id: 1)
      expect(image_idea).to respond_to(:idea_id)
    end
  end

end
