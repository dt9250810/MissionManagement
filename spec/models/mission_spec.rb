require 'rails_helper'

RSpec.describe MissionsController, type: :controller do
  it "validates columns" do
    expect(Mission.new(
      {
        title: 'test',
        context: 'context_text',
        status: '2',
        priority: '',
        start_time: Time.now,
        end_time: Time.now
      }
    )).not_to be_valid
  end
  
  it "validates datetimepicker" do
    expect(Mission.new(
      {
        title: 'test',
        context: 'context_text',
        status: '2',
        priority: '2',
        start_time: Time.now + 1,
        end_time: 1.day.ago
      }
    )).not_to be_valid
  end
end
