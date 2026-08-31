source $OMADEB_INSTALL/preflight/guard.sh
source $OMADEB_INSTALL/preflight/begin.sh
source $OMADEB_INSTALL/preflight/no-sleep.sh
source $OMADEB_INSTALL/preflight/identification.sh
run_logged $OMADEB_INSTALL/preflight/migrations.sh
run_logged $OMADEB_INSTALL/preflight/first-run-mode.sh
