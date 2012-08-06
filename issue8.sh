#!/bin/bash

# We'll separate input by date (daily)
# We'll then aggregate each by IP

LOGFILE=$1

if [ -z ${LOGFILE} ]; then
  echo "Missing log file ${LOGFILE}"
  exit
fi

# Split log by date
perl aal2d.pl "$LOGFILE" |
  fieldsplit -F IP -n "output-$$-" -p .

# Sort files individually
for i in $(ls output-$$-*); do
  cat $i |
    aggregate -k 1 -c 2 > $i.agg
done

# Merge all into the final file
# '-o <output file>' option is not specific regarding when 
# sorting will start writing to the new file,
# so we redirect standard output instead
sort -m $(ls output-$$-*.agg)

