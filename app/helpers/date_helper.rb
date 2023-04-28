module DateHelper
  # time_selectフィールドで取得したデータをDateTime型に変換する
  def build_datetime(date, time_data)
    DateTime.new(date.year, date.month, date.day, time_data['(4i)'].to_i, time_data['(5i)'].to_i)
  end

  def this_year
    Time.zone.today.year
  end

  def this_month
    Time.zone.today.month
  end
end
