require 'test_helper'

class DibTest < ActiveSupport::TestCase
  def setup
    @dib= Dib.create(name:"Death Star", note:"The power to blow crap up in space")
  end

  test "Dib should be valid" do
    assert @dib.valid?
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

  test "note should be present" do
    @dib.note=" "
    assert_not @dib.valid?
  end

  test "note should not be too long" do
    @dib.note= "a"*151
    assert_not @dib.valid?
  end

  test "note must not be too short" do
    @dib.note="aaaa"
    assert_not @dib.valid?
  end







end
