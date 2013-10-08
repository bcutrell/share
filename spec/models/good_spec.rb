require 'spec_helper'

describe Good do
  
  it {should belong_to (:user)}
  it {should belong_to (:group)}

  it {should have_valid(:location).when("Boston")}
  it {should_not have_valid(:location).when(nil, "")}

  it {should have_valid(:title).when("couch")}
  it {should_not have_valid(:title).when(nil, "")}

end
