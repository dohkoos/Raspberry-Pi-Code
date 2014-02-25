# Capture temperature & humidity value from the console
output = `sudo ./dht 22 4`
mt = /Temp =\s+([0-9.]+)/.match(output)
temperature = mt[1]

mt = /Hum =\s+([0-9.]+)/.match(output)
humidity = mt[1]

# Combined temperature & humidity value into json format
json_temperature = %Q[{\\"timestamp\\": \\"#{Time.now}\\", \\"value\\": #{temperature}}]
json_humidity = %Q[{\\"timestamp\\": \\"#{Time.now}\\", \\"value\\": #{humidity}}]

# Post json data to Yeelink
`curl -X POST -d "#{json_temperature}" -H "Content-Type: application/json" -H "U-ApiKey:XXXXXXXXXXXXXXXX" http://api.yeelink.net/v1.0/device/<device_id>/sensor/<sensor_id>/datapoints`
`curl -X POST -d "#{json_humidity}" -H "Content-Type: application/json" -H "U-ApiKey:XXXXXXXXXXXXXXXX" http://api.yeelink.net/v1.0/device/<device_id>/sensor/<sensor_id>/datapoints`
