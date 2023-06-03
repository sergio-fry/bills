require 'rails_helper'
require 'pundit/rspec'

RSpec.describe HomePolicy, type: :policy do
  subject(:policy) { described_class }

  let(:user) { User.new }

  permissions :show? do
    it { expect(policy).to permit(user, :home) }
  end
end
