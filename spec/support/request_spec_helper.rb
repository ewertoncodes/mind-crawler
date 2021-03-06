module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

  # generate JWT with Knock gem
  def authenticated_header(user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    { 'Authorization' => "Bearer #{token}" }
  end
end