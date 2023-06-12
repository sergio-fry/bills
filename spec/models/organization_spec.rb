require 'rails_helper'

RSpec.describe Organization do
  describe '.with_member' do
    subject(:scope) { described_class.with_member(user) }

    let(:owner) { create(:user) }
    let(:user) { create(:user) }
    let(:organization) { build(:organization) }

    before do
      Domain::CreateOrganization.new(creator: owner, organization:).call
    end

    context 'when user is an owner' do
      let(:user) { owner }

      it { expect(scope).to include organization }
    end

    context 'when user is a member' do
      before { Domain::AddMember.new(creator:, user:, organization:, role:).call }

      let(:creator) { owner }
      let(:role) { :member }

      it { expect(scope).to include organization }
    end

    context 'when user is NOT a member' do
      it { expect(scope).not_to include organization }
    end
  end
end
