#!/bin/zsh

# Generate the shell script so that I only ever have to edit the README.md

README=$(<README.md)
SH_TRIMMED_TOP=${README##*\`\`\`sh}
SH_TRIMMED_TOP_AND_BOT=${SH_TRIMMED_TOP%%\`\`\`*}
BASH_TRIMMED_TOP=${README##*\`\`\`bash}
BASH_TRIMMED_TOP_AND_BOT=${BASH_TRIMMED_TOP%%\`\`\`*}
ZSH_TRIMMED_TOP=${README##*\`\`\`zsh}
ZSH_TRIMMED_TOP_AND_BOT=${ZSH_TRIMMED_TOP%%\`\`\`*}

print ${SH_TRIMMED_TOP_AND_BOT:1:-1} >! k.sh
print ${BASH_TRIMMED_TOP_AND_BOT:1:-1} >! k.bash
print ${ZSH_TRIMMED_TOP_AND_BOT:1:-1} >! k.zsh
