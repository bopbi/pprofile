# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def current_year
    Time.now.strftime('%Y')
  end
  
  def truncate_words(text, length = 30, end_string = ' …')
  return if text == nil
  words = text.split()
  words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
  end
  
end
