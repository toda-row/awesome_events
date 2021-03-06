require 'rails_helper'

RSpec.describe "events/show", type: :view do

	context '未ログインユーザがアクセスしたとき' do
		before do
			allow(view).to receive(:logged_in?) { false }
			allow(view).to receive(:current_user) { nil }
		end

		context 'かつ @event.owner が nil のとき'
			before do
				assign(:event, create(:event, owner: nil))
				assign(:ticket, [])
			end

			it '"退会したユーザーです"と表示されていること' do
			 render
			 expect(rendered).to match /退会したユーザーです/
			end
		end
	end
end