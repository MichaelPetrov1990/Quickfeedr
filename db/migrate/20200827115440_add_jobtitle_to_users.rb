class AddJobtitleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :job_title, :string
  end
end
