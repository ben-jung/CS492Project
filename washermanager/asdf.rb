require 'gcm'
 
gcm = GCM.new("AIzaSyBXnTQ8lT_juLR18rDx8HieGl6-ICbqciM")
registration_ids= ["dNVRJhvKG2M:APA91bFXNojfQvn8PgI8wbsUY05b_trM3p7iyiw3Vgd0MeN1e8H_vphjCu0NoZEZwVhQN7z9UsVEKJajN4D1Wh89OWrTqZ0QNCloD5Zx-zKMEMWKGgLgEeWBV1xauC04GdT27IwBaYPU","cCSz3tdkuJk:APA91bFy24TEM45NHcgcDBEwtQUEBZtX5ZASi5t5Se18NoA4c3lfQgbNnAB49-fDuMq3uuM2kdf0YCw6OoCGR3uJMExgszsCQxp1WFYFRxYWF8e3OzF-tikkLKnbaDJkPRsddShBqS12"]
options = {data: {message: "qwerasdfzxcv"}}
response = gcm.send_notification(registration_ids, options)
puts response
