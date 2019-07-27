require "rails_helper"

feature "可新增自己的任務" do
  scenario "新增任務" do
    visit "/missions/new"
    expect(page).to have_http_status(200)
    fill_in :mission_title, with: "範例標題1"
    fill_in :mission_context, with: "範例內容1"
    click_button "確認"

    expect(page).to have_text "新增任務成功！"
  end
end