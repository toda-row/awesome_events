require 'spec_helper'

describe 'ユーザがイベントの参加や登録を行うために、ログインする' do
	context 'トップページに遷移し、"Twitterでログイン"をクリックしたとき' do
		context 'かつTwitterでのログインに成功したとき' do
			before do
				visit root_path
				click_link 'Twitterでログイン'
			end

			it 'トップページに繊維していること' do
				expect(page.current_path).to eq root_path
			end

			it '"ログインしました"と表示されること' do
				expcet(page).to have_content 'ログインしました'
			end
		end
	end
end
