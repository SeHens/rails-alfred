module ApplicationHelper
  def formatted_funding_date(date)
    day = date.day
    suffix = case day
             when 1, 21, 31 then 'st'
             when 2, 22 then 'nd'
             when 3, 23 then 'rd'
             else 'th'
             end
    day_with_suffix = "#{day}<sup>#{suffix}</sup>"
    "#{day_with_suffix} #{date.strftime('%b %y')}".html_safe
  end
end
