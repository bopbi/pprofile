class Notifications < ActionMailer::Base
  

  def contact(contact)
    subject    'Message From : '+ contact.name
    recipients 'bobby@papatong.com'
    from       contact.email
    sent_on    Time.now
    
    body       :message => contact.message
  end

end
