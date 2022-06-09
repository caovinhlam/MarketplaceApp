class CreateUserSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_sessions do |t|
      t.references :attendee, null: false, foreign_key: { to_table: :users }
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
