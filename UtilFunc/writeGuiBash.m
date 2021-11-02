function writeGuiBash(uid)

fp = fopen('run_para_fitting.csh', 'w');

fprintf(fp, '#!/bin/bash    \n');
fprintf(fp, 'set -e    \n');
fprintf(fp, 'matlab -nodisplay -r "init_para_fitting; run_para_fitting(%d)" >! output\n', uid);
fprintf(fp, 'matlab -nodisplay -r "init_para_fitting; run_para_fitting(%d)" >! output\n', uid);

fclose(fp);