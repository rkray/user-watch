#!/usr/bin/ruby

require 'etc'
require 'pp'
require 'nokogiri'
require 'dbus'
require 'getoptlong'

# Test Kommentar

uid=Etc.getpwnam('rene').uid

gdbus=%{
	gdbus introspect
		--system
		--dest org.freedesktop.login1
		--object-path /org/freedesktop/login1/user/_#{uid}
		--only-properties
		--xml
}
# pp gdbus
# result=system gdbus.gsub(/\n/,"")

# dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock
# dbus-send --session --dest=org.gnome.ScreenSaver --type=method_call --print-reply --reply-timeout=20000 /org/gnome/ScreenSaver org.gnome.ScreenSaver.SetActive boolean:true

#pp xml_doc  = Nokogiri::XML(result)

class UserWatch
    def help
        puts(
            "hello [OPTION] ... DIR",
            "",
            "   -h, --help: show help",
            "   --repeat x, -n x: repeat x times",
            "   --name [name]:",
            "       greet user by name, if name not supplied default is John",
            "",
            "   DIR: The directory in which to issue the greeting."
        )
    end

    def initialize
        opts = GetoptLong.new(
            [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
            [ '--repeat', '-n', GetoptLong::REQUIRED_ARGUMENT ],
            [ '--name', GetoptLong::OPTIONAL_ARGUMENT ]
        )


        dir = nil
        name = nil
        repetitions = 1
        opts.each do |opt, arg|
            case opt
            when '--help'
                help
                exit 0
            when '--repeat'
                repetitions = arg.to_i
            when '--name'
                if arg == ''
                    name = 'John'
                else
                    name = arg
                end
            end
        end
    end


    def run
        loop do
            sleep 1
            pp "do"
        end
    end
end

uw=UserWatch.new
uw.run


#!/bin/bash

# lock screen
# TODO: find out the right PID for /usr/lib/at-spi2-core/at-spi2-registryd
# export DBUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/4809/environ | sed 's/DBUS_SESSION_BUS_ADDRESS=//')
# dbus-send --session --dest=org.gnome.ScreenSaver --type=method_call --print-reply --reply-timeout=20000 /org/gnome/ScreenSaver org.gnome.ScreenSaver.SetActive boolean:true
