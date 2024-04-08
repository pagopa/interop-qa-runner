#!/usr/bin/env bash

sleep $ECS_TASK_MAX_DURATION_SECONDS

PROCESS_TO_FIND=$1
PROCESS_TO_KILL=$(ps -eux | grep -v "grep" | grep "$PROCESS_TO_FIND" | tr -s ' ')
PID_TO_KILL=$(ps -eux | grep -v "grep" | grep "$PROCESS_TO_FIND" | tr -s ' ' | cut -d ' ' -f 2)

echo "Task timeout" >&2
echo "Stop process $PROCESS_TO_FIND with PID: $PID_TO_KILL" >&2
echo "Process name: $PROCESS_TO_KILL"

# Graceful stop
kill -s TERM $PID_TO_KILL
# Wait for 30s
sleep 30
# Forceful stop
kill -9 $PID_TO_KILL
