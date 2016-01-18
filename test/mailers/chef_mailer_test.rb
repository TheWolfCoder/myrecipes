require 'test_helper'

class ChefMailerTest < ActionMailer::TestCase
  test "signup_confirmation" do
    mail = ChefMailer.signup_confirmation
    assert_equal "Signup confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
