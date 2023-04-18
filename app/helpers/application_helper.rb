module ApplicationHelper
  def this_year
    Time.zone.today.year
  end

  def this_month
    Time.zone.today.month
  end
end
