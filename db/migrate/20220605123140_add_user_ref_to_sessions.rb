class AddUserRefToSessions < ActiveRecord::Migration[7.0]
  def change
    add_reference :sessions, :user, null: false, foreign_key: true
  end
end
