#!/usr/bin/env node
var words = require('./words.js');
var randomWord = words[Math.floor(Math.random() * words.length)];
console.log(randomWord);
