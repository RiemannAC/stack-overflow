class CreateAnswerUpvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_upvotes do |t|
      t.references :user, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
    add_column :answers, :answer_upvotes_count, :integer, default: 0
  end
end
