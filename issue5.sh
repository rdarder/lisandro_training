#!/bin/bash

# We'll separate input by date (daily)
# We'll then sort each by IP and then merge

LOGFILE=$1

if [ -z ${LOGFILE} ]; then
  echo "Missing log file ${LOGFILE}"
  exit
fi

# Split log by date
perl aal2d.pl "$LOGFILE" |
  add_field -A Time -C Time -l TimeDay |
  convdate -F TimeDay -i "%d/%b/%Y:%H:%M:%S %z" -o "%Y-%m-%d" |
  fieldsplit -F TimeDay -n "output-$$-" -p .

# Sort files individually
for i in $(ls output-$$-*); do
  cat $i |
    sort -k 1,1 -t $'\xfe' -o $i
done

# Merge all into the final file
# '-o <output file>' option is not specific regarding when 
# sorting will start writing to the new file,
# so we redirect standard output instead
sort -m $(ls output-$$-*) |
  truncfield -f 4

