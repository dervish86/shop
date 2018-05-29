require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { build(:category) }

  it { should have_many(:products).dependent(:destroy) }
  it { should validate_presence_of(:name) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
