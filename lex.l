
delim             [ \t]
ws                {delim}+


%%

{ws}              ;/* Do Nothing */
"("               return(BRA);
")"               return(KET);
\n                return(NL);
