%{
#include "y.tab.h"
%}

%%
0   { return ZERO; }
1   { return ONE; }
2   { return TWO; }
\n  { return NL; }
.   { /* Ignore other characters, or handle errors */ }
%%

int yywrap() {
    return 1;
}
