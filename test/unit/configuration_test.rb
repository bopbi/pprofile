require 'test_helper'

class ConfigurationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Configuration.new.valid?
  end
end
