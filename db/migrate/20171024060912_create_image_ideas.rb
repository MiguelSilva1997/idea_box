class CreateImageIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :image_ideas do |t|
      t.references :idea, foreign_key: true, on_delete: :cascade
      t.references :image, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
