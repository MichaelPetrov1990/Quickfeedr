class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :type
      t.references :interview, null: false, foreign_key: true

      t.timestamps
    end
  end
end
