json.drivers do
  json.array!  @drivers, partial: 'api/drivers/model', as: :driver
end