#!/usr/bin/env sh

# erzeugt Sonntag, 03. April 2022 07:29 (C) 2022 von Leander Jedamus
# modifiziert Montag, 11. April 2022 16:52 von Leander Jedamus
# modifiziert Sonntag, 03. April 2022 08:34 von Leander Jedamus

#set -x

tmpfile2=/tmp/check_python2.tmp.$$
tmpfile3=/tmp/check_python3.tmp.$$

#lines2=$(LANG=C /usr/bin/env python2 --version 2> $tmpfile2 ; cat $tmpfile2 ; rm $tmpfile2)
#lines3=$(LANG=C /usr/bin/env python3 --version 2> $tmpfile3 ; cat $tmpfile3 ; rm $tmpfile3)

LANG=C /usr/bin/env python2 --version 2> $tmpfile2
retval2=$?
LANG=C /usr/bin/env python3 --version > $tmpfile3 2> /dev/null
retval3=$?

#echo "python2: $(cat $tmpfile2)"
#echo "python3: $(cat $tmpfile3)"

#echo

if [ $retval2 -eq 0 ]; then
  echo "Found python2 ($(cat $tmpfile2))."
fi

if [ $retval3 -eq 0 ]; then
  echo "Found python3 ($(cat $tmpfile3))."
fi

rm $tmpfile2 $tmpfile3

# vim:ai sw=2

