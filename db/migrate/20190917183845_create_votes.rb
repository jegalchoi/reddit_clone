class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.references :votable, null: false, polymorphic: true

      t.timestamps
    end
  end
end
