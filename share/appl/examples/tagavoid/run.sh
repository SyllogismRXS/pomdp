#!/bin/bash
###############################################################################
# Common calls...
# Usage: ./run.sh {example-name} {simLen} {simNum}"
###############################################################################
# Tiger: ./run.sh Tiger 100 1000 
###############################################################################

#E_BADARGS=65
#if [ $# -ne 3 ];
#then
#    echo "Usage: `basename $0` {example-name} {simLen} {simNum}"
#    exit $E_BADARGS
#fi

# Grab example name
EX="TagAvoid"
# Grab simLen
SIMLEN=100
# Grab simNum
SIMNUM=10

# Check if example POMDPX file exists...
if [ ! -f  ${APPL_ROOT}/examples/POMDPX/${EX}.pomdpx ];
then
    echo "File doesn't exist: "
    echo "${APPL_ROOT}/examples/POMDPX/${EX}.pomdpx"
    echo
    exit
fi

pomdpsol ${APPL_ROOT}/examples/POMDPX/${EX}.pomdpx

#pomdpsim --simLen ${SIMLEN} --simNum ${SIMNUM} --policy-file \
#    out.policy ${APPL_ROOT}/examples/POMDPX/${EX}.pomdpx
#
#pomdpeval --simLen ${SIMLEN} --simNum ${SIMNUM} --policy-file out.policy \
#    ${APPL_ROOT}/examples/POMDPX/${EX}.pomdpx

#polgraph --policy-file out.policy --policy-graph ${EX}.dot \
#    ${APPL_ROOT}/examples/POMDPX/${EX}.pomdpx

#dot -Tpdf ${EX}.dot -o ${EX}.pdf 

# convert POMDP file to POMDPX format
#pomdpconvert ${APPL_ROOT}/examples/POMDP/${EX}.pomdp
