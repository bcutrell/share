require 'spec_helper'

describe Seeders::Goods do
  let (:seeder) {Seeders::Goods}

  it 'seeds goods' do
    seeded_good = FactoryGirl.create(:good, :with_image).title
    seeder.seed
    expect(Good.where(title: seeded_good)).to be_present
  end

  it 'does not create duplicates' do
    seeder.seed
    count_after_seed = Good.count
    seeder.seed
    expect(Good.count).to eql(count_after_seed)
  end

end