require "test_helper"

class DibberTest < ActiveSupport::TestCase
  def setup
    @dibber=Dibber.new(name:"john", email:"john@john.com")
  end

  test "dibber must be valid" do
    assert @dibber.valid?
  end

  test "name must be present" do
    @dibber.name=" "
    assert_not @dibber.valid?
  end

  test "name must not be to long" do
    @dibber.name = "a"*41
    assert_not @dibber.valid?
  end

  test "name must not be too short" do
    @dibber.name="aa"
    assert_not @dibber.valid?
  end

  test "email must be present" do
    @dibber.email= " "
    assert_not @dibber.valid?
  end

  test "email must be within bounds" do
    @dibber.email="a" * 101  + "@example.com"
    assert_not @dibber.valid?
  end

  test "email should be unique" do
    dup_dibber = @dibber.dup
    dup_dibber.email = @dibber.email.upcase
    @dibber.save
    assert_not dup_dibber.valid?
  end

  test "email validation should accept valid email" do
    valid_adresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@exaple.com first.last@eee.com laura+joe@monk.com]
    valid_adresses.each do |va|
    @dibber.email= va
    assert @dibber.valid?,  "#{va.inspect} should be valid"
    end
  end

  test "email validation should reject invalid emails" do
    invalid_adresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am.com foo@ee+car.com]
    invalid_adresses.each do |ia|
    @dibber.email=ia
    assert_not @dibber.valid?, "#{ia.inspect} should be invalid"
    end
  end
end
