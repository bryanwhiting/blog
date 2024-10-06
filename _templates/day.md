<%*
// folder where this template will be rendered
const folder = 'goals';

const ymd = "YYYY-MM-DD"
const ddmd = "dd M/D"
const yday = moment(tp.file.title, ymd).add(-1, 'days')
const tday = moment(tp.file.title, ymd).add(0, 'days')
const tom = moment(tp.file.title, ymd).add(1, 'days')

// create header
let left = `[⏪ ${yday.format(ddmd)}](${folder}/${yday.format(ymd)})`;
let middle = moment(tp.file.title,'YYYY-MM-DD').format("dddd, MMMM Do, yyyy");
let right = `[${tom.format(ddmd)} ⏩](${folder}/${tom.format(ymd)})`;

let header =  `${left} | Let God Prevail | ${right}`;


-%>---
date: <% tday.format(ymd) %>
title: <% tday.format(ymd) %>
description: x
categories: goals
workout-time: 0
exercises:
  - x
pelo-warmup: 0
pelo-time: 0
pelo-kj: 0
pelo-avg: 0
pelo-res: 0
pelo-rpm: 0
pelo-dist: 0
avg-w: 0
run-dist: 0
run-time: 0
hike-dist: 0
hike-elev: 0
hike-time: 0
basketball-time: 0
bike-dist: 0
bike-time: 0
bike-elev: 0
hr-avg: 0
hr-range: ""
mile-run: ""
draft: false
---
**<% middle %>**
<%header%>


