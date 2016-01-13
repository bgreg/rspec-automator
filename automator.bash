#!/bin/bash

cd ~/place

for arg; do
  BRANCH=$arg
  UUID=$(uuidgen)
  FILE="rspec_resuls_for_${BRANCH}_${UUID}.txt"
  echo "creating a file called: ${FILE}"
  touch $FILE
  git checkout .
  bundle
  git checkout $BRANCH
  time bundle exec rspec spec > $FILE
done
