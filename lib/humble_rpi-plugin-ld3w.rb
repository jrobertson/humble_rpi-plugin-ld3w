#!/usr/bin/env ruby

# file: humble_rpi-plugin-ld3w.rb


require 'ld3w'
require 'run_every'


# Intended for using a Nokia LD-3W with a Raspberry Pi from the Humble_RPi gem


class HumbleRPiPluginLd3W

  def initialize(settings: {}, variables: {})

    h = {rfdevice: 'rfcomm0', bdaddress: '', channel: '1', 
         refresh_rate: 60}.merge settings
    device_id = variables[:device_id] || 'pi'

    ld3w = Ld3w.new device: h[:rfdevice], bdaddress: h[:bdaddress], 
        channel: h[:channel]

    RunEvery.new(seconds: h[:refresh_rate]) do

      loc = ld3w.locate
      variables[:notifier].notice "%s/gps: lat: %s lon: %s" % 
                                      [device_id,  loc.latitude, loc.longitude]
    end
    

  end
  
  alias on_start start  
  
end
