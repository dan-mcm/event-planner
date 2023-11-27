class UpdateEvents < ActiveRecord::Migration[7.1]
  def change
    change_table :events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.remove :date
    end
  end
end
