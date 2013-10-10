require 'spec_helper'

describe User do
  it {should have_many (:goods)}
  it {should have_many (:groups)}
  

  # it { should have_valid(:good).when(Good.new) }
  
  # it { should_not have_valid(:group).when(Group.new) }

# it { should have_valid(:username).when("gentlebuffalo") }
# it { should_not have_valid(:username).when("", nil) }

it { should have_valid(:email).when("bcutrell@gmail.com") }
it { should_not have_valid(:email).when("bcutrell", "12345", 12345, nil) }

it { should have_valid(:password).when("password") }
it { should_not have_valid(:password).when("", nil) }
end
