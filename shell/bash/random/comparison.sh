#!/bin/bash

NUM1="4"
NUM2="3"
if ["$NUM1" -gt "$NUM2"];
then
 echo "$NUM1 is greater than $NUM2"
else
 echo "$NUM1 is not greater than $NUM2"
fi
