class CreateFrelanceers < ActiveRecord::Migration[6.0]
  def change
    create_table :frelanceers do |t|
      t.string :name
      t.string :email
      t.integer :phone_number
      t.text :biography
      t.boolean :email_confirmed, default: false
      t.string :confirm_token

      t.timestamps
    end
  end
end
