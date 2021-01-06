class ChangePhoneNumberTypeInFreelancer < ActiveRecord::Migration[6.0]
  def change
    change_column :freelancers, :phone_number, :string
  end
end
