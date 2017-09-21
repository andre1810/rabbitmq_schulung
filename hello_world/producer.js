#!/usr/bin/env node

var amqp = require('amqplib/callback_api');

amqp.connect('amqp://rabbit01.vagrant.test', function (err, conn) {
  conn.createChannel(function (err, ch) {
    var q = 'hello';
    var msg = 'Hello World!';

    ch.assertQueue(q, { durable: false });
    // Note: on Node 6 Buffer.from(msg) should be used
    for (var i = 0; i < 100; i++) {
      ch.sendToQueue(q, new Buffer(msg));
      console.log(" [x] Sent %s %i", msg, i);
    }

    conn.close(); process.exit(0);
  });
});
