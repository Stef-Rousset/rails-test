class RenameTableFreelancer < ActiveRecord::Migration[6.0]
  def change
    rename_table :frelanceers, :freelancers
  end
end
