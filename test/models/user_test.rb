require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "admin" do
    admin_user = users(:admin)

    assert admin_user
  end

  test "user" do
    demo_user = users(:demo)

    assert demo_user
  end
end
