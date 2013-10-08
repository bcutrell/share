require 'spec_helper'

describe Group do
  it {should have_many (:goods) }
  it {should have_many (:users) }
 

  # it {should have_valid(:good).when(Good.new)}

    it { should have_valid(:name).when("Patsfans") }
    it { should have_valid(:name).when(nil, "") }

    it { should have_valid(:password).when("password") }
    it { should have_valid(:password).when(nil, "") }

  # it {should have_valid(:user).when(User.new)}
  
end
