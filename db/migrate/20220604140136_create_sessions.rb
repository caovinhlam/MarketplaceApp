class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
