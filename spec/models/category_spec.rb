require 'spec_helper'

describe Category do
  it {should have_many (:goods)}

  it {should have_valid(:name).when("Bathroom", "Kitchen")}
  it {should_not have_valid(:name).when(nil, " ", "Sausage")}
end
