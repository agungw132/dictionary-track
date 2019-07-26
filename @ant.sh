#!/bin/sh

clear
word=`curl --get --include "https://wordsapiv1.p.rapidapi.com/words/$1/antonyms" \
  -H 'X-RapidAPI-Host: wordsapiv1.p.rapidapi.com' \
  -H 'X-RapidAPI-Key: [key]' | \
grep "{"`
echo $word
mosquitto_pub -h [host] -u [user] -P [password] -t tele/home-mn356/dictionary/antonyms/$1 -m "$word"


