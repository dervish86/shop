require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:category) { create(:category) }
  subject { build(:product, category_id: category.id) }

  it { should belong_to(:category) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:score) }
  it { should validate_numericality_of(:score) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid with wrong url' do
    subject.url = 'error'
    expect(subject).to_not be_valid
  end

  it 'is not valid with wrong image url' do
    subject.image = 'error'
    expect(subject).to_not be_valid
  end
end
