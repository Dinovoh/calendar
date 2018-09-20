class Relation < ApplicationRecord
  belongs_to :event
  belongs_to :user

  def creator
    self.creator = true
  end
end
