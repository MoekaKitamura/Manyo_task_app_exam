require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  describe '登録機能' do
    context 'タスクを登録した場合' do
      it '登録したタスクが表示される' do
        visit new_task_path
        fill_in "Title", with: "タスクタイトル"
        fill_in "Content", with: "タスク内容"
        click_button "Create Task"
        expect(page).to have_content "Task was successfully created."
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '登録済みのタスク一覧が表示される' do
        FactoryBot.create(:task, title: "書類作成")
        visit tasks_path
        expect(page).to have_content '書類作成'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      let(:task) { FactoryBot.create(:task, title: "書類作成") }

      it 'そのタスクの内容が表示される' do
        visit task_path(task)
        expect(page).to have_content '書類作成'
      end
    end
  end
end