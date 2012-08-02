require "test_helper"
require "date"
class PeselTest < MiniTest::Unit::TestCase
  def test_should_generate_valid_pesel_for_19th_century
    date = Date.parse("1803-10-20")
    pesel = Rpg::Pesel.new(date: date).generate
    @pesel = Yapv::Pesel.new(pesel)

    assert @pesel.valid?
    assert_equal date, @pesel.birth_date
  end

  def test_should_generate_valid_pesel_for_20th_century
    date = Date.parse("1920-04-11")
    pesel = Rpg::Pesel.new(date: date).generate
    @pesel = Yapv::Pesel.new(pesel)

    assert @pesel.valid?
    assert_equal date, @pesel.birth_date
  end

  def test_should_generate_valid_pesel_for_21st_century
    date = Date.parse("2012-06-02")
    pesel = Rpg::Pesel.new(date: date).generate
    @pesel = Yapv::Pesel.new(pesel)

    assert @pesel.valid?
    assert_equal date, @pesel.birth_date
  end

  def test_should_generate_valid_pesel_for_22nd_century
    date = Date.parse("2165-11-06")
    pesel = Rpg::Pesel.new(date: date).generate
    @pesel = Yapv::Pesel.new(pesel)

    assert @pesel.valid?
    assert_equal date, @pesel.birth_date
  end

  def test_should_generate_valid_pesel_for_23rd_century
    date = Date.parse("2289-11-12")
    pesel = Rpg::Pesel.new(date: date).generate
    @pesel = Yapv::Pesel.new(pesel)

    assert @pesel.valid?
    assert_equal date, @pesel.birth_date
  end

  def test_should_raise_argument_error_for_date_below_18th_century
    assert_raises ArgumentError do
      Rpg::Pesel.new(date: "1799-04-11").generate
    end
  end

  def test_should_raise_argument_error_for_date_over_23rd_century
    assert_raises ArgumentError do
      Rpg::Pesel.new(date: "2300-04-11").generate
    end
  end

  def test_should_generate_pesel_for_female
    @pesel = Rpg::Pesel.new(gender: :female, date: "2020-04-11").generate
    assert Yapv::Pesel.new(@pesel).valid?
    assert_equal :female, Yapv::Pesel.new(@pesel).gender
  end

  def test_should_generate_pesel_for_male
    @pesel = Rpg::Pesel.new(gender: :male, date: "2020-04-11").generate
    assert Yapv::Pesel.new(@pesel).valid?
    assert_equal :male, Yapv::Pesel.new(@pesel).gender
  end

  def test_should_accept_date_as_string
    @pesel = Rpg::Pesel.new(date: "2020-04-11").generate
    assert Yapv::Pesel.new(@pesel).valid?
  end

  def test_should_accept_date_as_date_object
    @pesel = Rpg::Pesel.new(date:Date.today).generate
    assert Yapv::Pesel.new(@pesel).valid?
  end

  def test_generated_pesel_should_be_unique
    numbers = [].tap do |content|
      10.times{ content << Rpg::Pesel.new(date: Date.today).generate }
    end

    assert numbers.uniq.size != 1
  end
end