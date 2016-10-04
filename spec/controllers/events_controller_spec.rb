require 'rails_helper'

RSpec.describe EventsController, type: :controller do

describe 'GET #new' do
	context '未ログインユーザがアクセスしたとき' do
		before { get }

		it 'トップページにリダイレクトすること' do
			expect(respnse).to redirect_to(root_path)
		end
	end

	context 'ログインユーザーがアクセスしたとき' do
		before do 
			user = create :user
			session[:user_id] = user.id
			get :new
		end

		it 'ステータスコードとして200があること' do
			expect(response.status).to eq(200)
		end

		it '@event に、新規Eventオブジェクトが格納されていること' do
			expect(assigns(:event)).to be_a_new(Event)
		end

		it 'new　テンプレートをrenderしていること' do
			expect(response).to render_template :new
		end
	end

end

end
