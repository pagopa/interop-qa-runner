#!/usr/bin/env bash

INTERACTIVE="FALSE"
if [ "$(echo $INTERACTIVE_MODE | tr '[:upper:]' '[:lower:]')" == "true" ]; then
	INTERACTIVE="TRUE"
fi

node -v