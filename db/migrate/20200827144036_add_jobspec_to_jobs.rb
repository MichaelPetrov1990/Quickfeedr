class AddJobspecToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :job_spec, :text
  end
end
