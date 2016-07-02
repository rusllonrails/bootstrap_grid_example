class Provider < ActiveRecord::Base

  class << self
    def json_entries(query=nil)
      scope =  if query.present?
        where("name ilike ?", "%#{query}%").order(created_at: :asc)
      else
        order(created_at: :asc)
      end

      records = scope.map do |item|
        {
          "s_id" => item.id,
          "s_name" => item.name,
          "s_code" => item.code,
          "s_top_on" => item.top_on ? '1' : '0',
          "start_work" => nil,
          "check" => nil
        }
      end

      {
        records: records,
        total: records.count
      }.to_json
    end
  end
end
