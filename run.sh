docker run --rm \
  --volume "$PWD/Tests":/home/robot/tests \
  --volume "$PWD/reports":/home/robot/reports \
  robotframework/rfdocker:latest \
  tests
  


#docker build -t customrf .

#docker run \
#  --rm \
#  --volume "$PWD":/home/robot/ \
#  -e ENV="$ENV" \
#  customrf:latest \
#  --variablefile "env/$ENV.yaml" \
#  --pythonpath "resources/" \
#  tests