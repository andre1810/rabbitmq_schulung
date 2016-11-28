#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'bunny'

customers = [{
              id: 1,
              name: 'André Hester',
              email: 'ahester@nospam.com'
            },
            {
              id: 2,
              name: 'Max Mustermann',
              email: 'max@mustermann.de'
            },
            {
              id: 3,
              name: 'Martha Pfahl',
              email: 'mpfahl86@gmail.com'
            },
            {
              id: 4,
              name: 'Rainer Zufall',
              email: 'rainer.zufall@web.de'
            }]

notifications = ["Benachrichtigung 1", "Benachrichtigung 2"]

def get_customer_string(customer)
  [customer[:id], customer[:name], customer[:email]].join '|'
end

STDOUT.sync = true

conn = Bunny.new(host: 'rabbit01.vagrant.test')
conn.start

ch = conn.create_channel
q  = ch.queue('notifications')
x  = ch.default_exchange

notification_seq_nr = 1
while
  random_customer = customers.sample

  message = "#{get_customer_string(random_customer)}|#{notification_seq_nr}|#{notifications.sample}"
  puts "Send: #{message}"
  x.publish(message, routing_key: q.name)
  #sleep 0.1

  notification_seq_nr += 1
end

conn.close
