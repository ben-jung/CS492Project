json.array!(@washing_machines) do |washing_machine|
  json.extract! washing_machine, :id, :floor, :dorm, :state
  json.url washing_machine_url(washing_machine, format: :json)
end
