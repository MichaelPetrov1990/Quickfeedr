class ChangeColumnFeedback < ActiveRecord::Migration[6.0]
  def change
    remove_column :feedbacks, :type
    add_column :feedbacks, :message, :string
  end
end
