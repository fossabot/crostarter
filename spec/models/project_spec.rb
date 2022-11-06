require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validation' do
    subject do
      user = User.create(
        username: 'minion',
        password: 'donottellanyone',
      )
      category = Category.create(name: 'IoT')
      described_class.new(
        title: 'Bubbla',
        website: 'bubbla.io',
        description: 'Social networking application',
        end_date: Date.tomorrow,
        funding_goal: 130.26,
        details: 'none as of now',
        creator: user,
        category:,
      )
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid with no title' do
      subject.title = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with no end date' do
      subject.end_date = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with no funding goal amount' do
      subject.funding_goal = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with no creator' do
      subject.creator = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with no creator id' do
      subject.creator_id = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with no category' do
      subject.category = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with no category id' do
      subject.category_id = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with invalid funding goal data type' do
      subject.funding_goal = 'twenty'
      expect(subject).not_to be_valid
    end

    it 'is valid with funding goal as string' do
      subject.funding_goal = '20'
      expect(subject).to be_valid
    end

    it 'is not valid with a shorter title (less than 2 characters long)' do
      subject.title = 'I'
      expect(subject).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:creator) }
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_one_attached(:avatar) }
  end
end