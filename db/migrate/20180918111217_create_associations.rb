class CreateAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :associations do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true
    end
  end
end
