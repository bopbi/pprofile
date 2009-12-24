# Helper Utility Koleksiku
module BobbyUtilityHelper
  def current_year
    Time.now.strftime('%Y')
  end
  
  def simple_format_truncate_words(text, length = 30, end_string = ' …')
    return if text == nil
    words = text.split()
    w = words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
    simple_format w
  end
  
end
