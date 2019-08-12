#!/bin/sh

clear
bearer='{"sourceLanguageCode":"en","targetLanguageCode":"id","contents":"'$1'"}'
#echo $bearer
result=`curl -s -X POST -H "Authorization: Bearer "$(gcloud auth application-default print-access-token) -H "Content-Type: application/json; charset=utf-8" -d $bearer https://translation.googleapis.com/v3beta1/projects/[project_id]:translateText`
echo $result
mosquitto_pub -h [host] -u [user] -P [password] -t tele/home-mn356/dictionary/translate/$1 -m "$result"
