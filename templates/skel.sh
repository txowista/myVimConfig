#!/bin/bash



set -euo pipefail    
# -e  exit if any command has non-zero exit
# -u error if set a reference, hasn't previously defined
# -o pipefail prevents error in a pipeline from being masked







main()
{
  holaMundo
}

holaMundo() {
local MSG="hola Mundo"
echo ${MSG}

}

main 
