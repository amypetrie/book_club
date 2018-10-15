module ApplicationHelper

  def rounded_1(num)
    if num == nil
      "0"
    else
      num.round(1)
    end
  end

end
