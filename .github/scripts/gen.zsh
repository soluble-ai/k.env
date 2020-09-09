#!/bin/zsh

# Generate the shell script so that I only ever have to edit the README.md

README=$(<README.md)
TRIMMED_TOP=${README##*\`\`\`sh}
TRIMMED_TOP_AND_BOT=${TRIMMED_TOP%%\`\`\`*}

print ${TRIMMED_TOP_AND_BOT:1:-1} >! k.sh
