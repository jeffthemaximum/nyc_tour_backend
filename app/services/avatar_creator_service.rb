class AvatarCreatorService < ApplicationService
  include HTTParty

  def initialize(email)
    @email = email
  end

  def call
    gender = getGender
    url = "https://avatars.dicebear.com/v2/#{gender}/#{@email.gsub(/\s+/, "")}.svg"
    res = HTTParty.get(url)

    {
      url: url,
      svg: res.body
    }
  end

  private
    def getGender
      [
        'male',
        'female'
      ].sample
    end
end
