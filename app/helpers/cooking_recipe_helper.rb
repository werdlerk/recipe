module CookingRecipeHelper

  def format_datetime(datetime)
    datetime.strftime("%-m %b %Y")
  end

  def abbreviate(str)
    if str.length < 150
      str
    else
      str[0..str.rindex(" ", 150)] + "..."
    end
  end
  
end
