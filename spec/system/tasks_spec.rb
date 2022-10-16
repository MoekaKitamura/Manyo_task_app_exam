require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  describe '登録機能' do
    context 'タスクを登録した場合' do
      it '登録したタスクが表示される' do
        visit new_task_path
        fill_in "タイトル", with: "タスクタイトル"
        fill_in "内容", with: "タスク内容"
        click_button "登録する"
        expect(page).to have_content "タスクを登録しました"
      end
    end
  end

  describe '一覧表示機能' do
    let!(:first_task) { FactoryBot.create(:task, title: "first_task", created_at: Time.zone.now.ago(3.days)) }
    let!(:second_task) { FactoryBot.create(:task, title: "second_task", created_at: Time.zone.now.ago(2.days)) }
    let!(:third_task) { FactoryBot.create(:task, title: "third_task", created_at: Time.zone.now.ago(1.days)) }

    before do
      visit tasks_path
    end

    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が作成日時の降順で表示される' do
        task_list = all('body tbody tr')
        expect(task_list[0]).to have_content 'third_task'
        expect(task_list[1]).to have_content 'second_task'
        expect(task_list[2]).to have_content 'first_task'
      end
    end

    context '新たにタスクを作成した場合' do
      let!(:new_task) { FactoryBot.create(:task, title: "new_task") }

      it '新しいタスクが一番上に表示される' do
        visit current_path
        task_list = all('body tbody tr')
        expect(task_list[0]).to have_content 'new_task'
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