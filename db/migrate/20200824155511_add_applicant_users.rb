class AddApplicantUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :applicant, :boolean
  end
end
