class Mission < ApplicationRecord
  belongs_to :user
  default_scope { order("created_at DESC") }
  validates_presence_of :title, :context, :status, :priority, :start_time, :end_time
  validate :datetime_validate

  STATUS_OPTIONS = [['待處理', 1], ['進行中', 2], ['已完成', 3]]
  PRIORITY_OPTIONS = [['高', 1], ['中', 2], ['低', 3]]

  private
  def datetime_validate
    if start_time > end_time
      errors[:start_time] << '不可大於結束時間'
    end
  end
end
