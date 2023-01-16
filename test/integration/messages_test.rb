require "test_helper"

class MessagesTest < ActionDispatch::IntegrationTest
  setup do
    @regular_user = users(:two)
  end

  test "authenticated user can view all messages" do
    sign_in @regular_user
    get messaged.messages_path

    assert_response :success
    assert_select "div#messages"
    assert_select "turbo-frame##{dom_id(@regular_user.messages.first)}", count: 1
    assert_select "turbo-frame##{dom_id(@regular_user.messages.second)}", count: 1
  end

  test "non-authenticated user cannot view messages" do
    get messaged.messages_path
    assert_response :redirect
    assert_redirected_to messaged.new_user_session_url
  end

  test "can create a new message" do
    sign_in @regular_user
    new_message = "here is a new message to the team."

    get messaged.messages_path

    assert_select "turbo-frame p", text: new_message, count: 0

    post messaged.messages_url, params: {
      message: {
        content: new_message
      }
    }, as: :turbo_stream

    assert_response :success
    assert_select "turbo-frame p", text: new_message, count: 1
  end

  test "submitting an empty message content" do
    sign_in @regular_user

    post messaged.messages_url, params: {
      message: {
        content: ""
      }
    }, as: :turbo_stream

    assert_response :unprocessable_entity
    assert_select "p.error", /Content can't be blank/
  end

  test "editing a message" do
    sign_in @regular_user

    patch messaged.message_path(@regular_user.messages.first), params: {
      message: {
        content: "An updated message!"
      }
    }, as: :turbo_stream

    assert_response :success
    assert_select "turbo-frame p", text: "An updated message!", count: 1
  end

  test "deleting a message" do
    sign_in @regular_user
    message = @regular_user.messages.first

    get messaged.messages_path

    assert_select "turbo-frame p", text: message.content

    delete messaged.message_path(message), as: :turbo_stream

    assert_response :success
    assert_select "turbo-frame p", text: message.content, count: 0
  end
end