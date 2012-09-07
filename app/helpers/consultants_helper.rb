module ConsultantsHelper
  
  # Returns the Gravatar (http://gravatar.com/) for the given user
  def gravatar_for(consultant, options = { size: 50 })  
    gravatar_id = Digest::MD5::hexdigest(consultant.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: consultant.last_name, class: "gravatar")
   
  end
end
