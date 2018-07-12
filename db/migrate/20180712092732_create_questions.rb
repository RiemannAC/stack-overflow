class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string  :title, null: false
      t.text    :content, null: false
      t.integer :answers_count, default: 0
      t.integer :favorites_count, default: 0
      t.integer :votes_count, default: 0

      t.timestamps
    end
    add_index :questions, :user_id
  end
end
