# Introducing the Humble RPi Plugin LD3W


## Usage

    require 'sps-pub'
    require 'humble_rpi-plugin-ld3w'

    sps = SPSPub.new(host: 'sps.home')

    rpi = HumbleRPiPluginLd3W.new(settings: {rfdevice: 'rfcomm0', 
              bdaddress: '00:02:76:C9:60:28', channel: '1', refresh_rate: 120}, 
              variables: {notifier: sps}, debug: true)
    rpi.on_start

The above example requests the GPS coordinates from the Nokia LD-3W every 2 minutes and publishes the longitude and latitude to an SPS broker.

humblerpi plugin gem gps ld3w
