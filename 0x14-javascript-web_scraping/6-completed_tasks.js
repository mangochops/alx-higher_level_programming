#!/usr/bin/node

const request = require('request');

const url = process.argv[2];

request(url, (error, response, body) => {
  if (error) {
    console.error('Error:', error);
    return;
  }

  const tasks = JSON.parse(body);
  const completedTasksByUser = {};

  tasks.forEach(task => {
    if (task.completed) {
      if (!completedTasksByUser[task.userId]) {
        completedTasksByUser[task.userId] = 0;
      }
      completedTasksByUser[task.userId] += 1;
    }
  });

  console.log(completedTasksByUser);
});
