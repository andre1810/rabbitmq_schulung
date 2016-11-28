#!/usr/bin/env ruby
# encoding: utf-8

require 'bunny'

conn = Bunny.new(host: 'rabbit01.vagrant.test', automatically_recover: false)
conn.start

ch   = conn.create_channel
q    = ch.queue('notifications')

ch.prefetch(1)
puts " [*] Waiting for messages. To exit press CTRL+C"

def pretty_notification(message)
  message_parts = message.split '|'

  {
    customer_nr: message_parts[0],
    customer_name: message_parts[1],
    customer_email: message_parts[2],
    notification_seq_nr: message_parts[3],
    nofitication: message_parts[4]
  }
end

def print_notification(notification)
  puts "Customer Nr: #{notification[:customer_nr]}"
  puts "Customer: #{notification[:customer_name]} <#{notification[:customer_email]}>"
  puts "Notification Seq Nr: #{notification[:notification_seq_nr]}"
  puts "Notification: #{notification[:nofitication]}"
  puts '---------------------------------------------------'
end

begin
  q.subscribe(manual_ack: true, block: true) do |delivery_info, properties, body|
    pretty_notification = pretty_notification(body)
    print_notification(pretty_notification)
    ch.ack(delivery_info.delivery_tag)
  end
rescue Interrupt => _
  conn.close
end
