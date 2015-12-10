namespace :push do
   desc "Set up initial roles in the database"
   task :noties,[:machine_id] => :environment do |t, args|
     machine_id = args[:machine_id]


    gcm = GCM.new("AIzaSyBXnTQ8lT_juLR18rDx8HieGl6-ICbqciM")
    # you can set option parameters in here
    #  - all options are pass to HTTParty method arguments
    #  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L40-L68
    #  gcm = GCM.new("my_api_key", timeout: 3)

    trackings = Tracking.where(machine_id: machine_id)
    registration_ids=trackings.map{|x| x.APNS_token}  # an array of one or more client registration IDs
    trackings.map{|x| x.destroy}
    options = {data: {message: WashingMachine.find(machine_id)}, collapse_key: "updated_score"}
    response = gcm.send(registration_ids, options)

   end
end
