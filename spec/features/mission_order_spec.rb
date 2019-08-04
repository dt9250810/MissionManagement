require "rails_helper"

feature "任務依建立時間排序" do
  scenario "依建立時間排序" do
    visit user_missions_path(current_user)
    expect(page).to have_http_status(200)

    # mission_order = Mission.order('created_at DESC').map { |mission| page.body.index(mission.id) }
    mission_order = Mission.order('created_at DESC').limit(5).map { |mission| mission.id }
    mission_order2 = Mission.all.limit(5).map { |mission| mission.id }
    expect(mission_order).to eq(mission_order2)

  end
end