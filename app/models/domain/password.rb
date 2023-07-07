module Domain
  class Password
    def password = @password ||= (1..10).map { rand(10).to_s }.join
    alias to_s password
  end
end
