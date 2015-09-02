module ApplicationHelper
  def gravatar_for(dibber, options ={size:80})
    gravatar_id = Digest::MD5::hexdigest(dibber.email.downcase)
    size= options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: dibber.name, class:"gravatar")
  end 
end
