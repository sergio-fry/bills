module Domain
  class CreateUserByPhone
    def initialize(creator:, phone:, name:)
      @creator = creator
      @phone = phone
      @name = name
    end

    Result = Data.define(:success?, :errors, :user)

    def call
      user = User.find_by(phone: @phone) ||
             User.new(phone: formatted_phone, name: @name, email:)

      if user.save
        Result.new(success?: true, errors: [], user:)
      else
        Result.new(success?: false, errors: user.errors, user:)
      end
    end

    def email = "#{phone_slug}@example.com}"
    def formatted_phone
      @phone.remove(/[^0-9+]/)
    end

    def phone_slug = formatted_phone[1..-1]
  end
end
