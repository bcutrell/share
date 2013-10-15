require 'spec_helper'

describe Categorization do
  it {should belong_to (:good)}
  it {should belong_to (:category)}

  it {should have_valid(:good).when(Good.new)}
  it {should_not have_valid(:good).when(nil)}

  it {should have_valid(:category).when(Category.new)}
  it {should_not have_valid(:category).when(nil)}
end
