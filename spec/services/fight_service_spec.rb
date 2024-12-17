# spec/services/fight_service_spec.rb
require 'rails_helper'

RSpec.describe FightService, type: :service do
  let(:hero1) { create(:hero, health: 100, attack: 10) }
  let(:hero2) { create(:hero, health: 80, attack: 15) }

  describe '#call' do
    context 'when hero1 wins' do
      it 'returns the correct winner' do
        result = described_class.new(hero1, hero2).call
        expect(result[:winner]).to eq(hero1)
      end
    end

    context 'when hero2 wins' do
      let(:hero1) { create(:hero, health: 50, attack: 5) }
      let(:hero2) { create(:hero, health: 100, attack: 20) }

      it 'returns the correct winner' do
        result = described_class.new(hero1, hero2).call
        expect(result[:winner]).to eq(hero2)
      end
    end

    context 'when there is a draw (?)' do
      let(:hero1) { create(:hero, health: 100, attack: 10) }
      let(:hero2) { create(:hero, health: 100, attack: 10) }

      it 'returns a draw' do
        result = described_class.new(hero1, hero2).call
        expect(result[:winner]).to be(nil)
      end
    end
  end
end
