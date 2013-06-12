#!/bin/bash

pomdpsol ${APPL_ROOT}/examples/POMDPX/Tiger.pomdpx

pomdpsim --simLen 100 --simNum 1000 --policy-file \
    out.policy ${APPL_ROOT}/examples/POMDPX/Tiger.pomdpx

pomdpeval --simLen 100 --simNum 1000 --policy-file out.policy \
    ${APPL_ROOT}/examples/POMDPX/Tiger.pomdpx

polgraph --policy-file out.policy --policy-graph tiger.dot \
    ${APPL_ROOT}/examples/POMDPX/Tiger.pomdpx

dot -Tpdf tiger.dot -o tiger.pdf 

# convert POMDP file to POMDPX format
#pomdpconvert ${APPL_ROOT}/examples/POMDP/Tiger.pomdp
