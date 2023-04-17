class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies, id: false do |t|
      t.primary_key :id, :uuid, default: -> { "gen_random_uuid()" }
      t.string :name, null: false
      t.string :address, null: false, default: ""

      t.timestamps
    end
  end
end
