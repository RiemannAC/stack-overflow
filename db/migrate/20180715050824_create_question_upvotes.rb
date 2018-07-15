class CreateQuestionUpvotes < ActiveRecord::Migration[5.1]
  def change
    create_table :question_upvotes do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
