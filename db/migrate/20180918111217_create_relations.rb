class CreateRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true
      t.boolean :creator
      t.string :status
    end
  end
end
