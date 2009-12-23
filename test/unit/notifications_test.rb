require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "contact" do
    @expected.subject = 'Notifications#contact'
    @expected.body    = read_fixture('contact')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_contact(@expected.date).encoded
  end

end
