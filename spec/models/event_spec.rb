require 'spec_helper'

describe Event do
	describe '#name' do
		it { should validate_presence_of(:name) }
		it { should ensure_length_of(:name).is_at_most(50)}
	end

	describe '#craeted_by?' do
		let(:event) { create(:event) }
		subject { event.created_by?(user) }

		context '引数が　nil なとき' do
			let(:user) {nil}
			it { should be_falsey }
		end

		context '#owner_id と 引数の#idが同じとき' do
			let(:user) { double('user', id: event.id) }
			it { should be_truthy }
		end
	end
end
