#!/usr/bin/env ruby

# file: humble_rpi-plugin-ld3w.rb

# Intended for using a Nokia LD-3W with a Raspberry Pi from the Humble_RPi gem

require 'ld3w'


class HumbleRPiPluginLd3W
  using ColouredText

  def initialize(settings: {}, variables: {}, debug: false)

    h = {rfdevice: 'rfcomm0', bdaddress: '', channel: '1', 
         refresh_rate: 120}.merge settings
    @device_id = variables[:device_id] || 'pi'
    @debug, @h, @notifier = debug, h, variables[:notifier]

    @ld3w = Ld3w.new device: h[:rfdevice], bdaddress: h[:bdaddress], 
        channel: h[:channel], verbose: false, affirmations: 5
    
  end
  
  def start()          
        
    begin
      
      loc = @ld3w.locate        
      puts ('loc: ' + loc.inspect).debug if @debug
      located = loc.is_a?(Array) ? loc.last : loc
      @notifier.notice "%s/gps: lat: %s lon: %s" % 
                            [@device_id,  located.latitude, located.longitude]
      sleep(@h[:refresh_rate])                                    
    rescue
      
      @notifier.notice "%s/gps/warning: %s" % [@device_id, 
                                                'unable to connect']
      `service bluetooth restart`
      sleep 6
      
    end 
    

    start()
  
  end
  
  alias on_start start  
  
end
