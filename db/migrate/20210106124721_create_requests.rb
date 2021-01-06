class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :freelancer, null: false, foreign_key: true
      t.boolean :status, default: false
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
