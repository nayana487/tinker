class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table "posts", force: :cascade do |t|
      t.string  "shoe_name"
      t.string  "shoe_photo"
      t.string  "fan_message"
      t.integer "fan_id"
    end
  end
end
