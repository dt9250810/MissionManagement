class Mission < ApplicationRecord
  default_scope { order("created_at DESC") }
  validates_presence_of :title, :context, :status, :priority, :start_time, :end_time
  validate :datetime_validate

  STATUS_OPTIONS = [%w(待處理 1), %w(進行中 2), %w(已完成 3)].freeze
  PRIORITY_OPTIONS = [%w(高 1), %w(中 2), %w(低 3)].freeze


  private
  def datetime_validate
    if start_time > end_time
      errors[:start_time] << '不可大於結束時間'
    end
  end
end
