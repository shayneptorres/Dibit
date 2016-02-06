require 'test_helper'

class DibTest < ActiveSupport::TestCase
  def setup
    @dibber= Dibber.create(name:"chuck", email:"chuck@chuck.com")
    @dib= @dibber.dibs.build(name:"Death Star", note:"The power to blow crap up in space")
  end

  test "Dib should be valid" do
    assert @dib.valid?
  end

  test "Dibber_id should be present" do
    @dib.dibber_id = nil
    assert_not @dib.valid?
  end

  test "name should be present" do
    @dib.name= " "
    assert_not @dib.valid?
  end

  test "name must not be too long" do
    @dib.name="a"*101
    assert_not @dib.valid?
  end

  test "name must not be too short" do
    @dib.name="aaaa"
    assert_not @dib.valid?
  end
end
