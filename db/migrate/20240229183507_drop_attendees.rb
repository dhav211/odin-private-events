class DropAttendees < ActiveRecord::Migration[7.1]
  def change
    drop_table :attendees
  end
end
