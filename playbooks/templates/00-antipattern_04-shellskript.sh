#!/bin/bash
DATE="$(date '+%Y%m%d')"
TIME="$(date '+%H:%M')"
LOG_FILE="[...]/${DATE}_${TIME}.log"

ORACLE_SID="{{ target_oracle_sid }}"
source  [...]/.profile

${ORACLE_HOME}/bin/sqlplus -s / as sysdba <<EOF >"${LOG_FILE}" 2>&1
shutdown abort;
startup nomount;
exit;
EOF

echo "${TIME} - Database ${ORACLE_SID} in nomount successfully started!" >>"${LOG_FILE }" 2>&1
