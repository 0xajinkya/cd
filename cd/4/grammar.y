%{
#include <stdio.h>
int flag =0;
%}


%token ZERO ONE NL

%%
str1 : str2 n1 { };
str2 : ZERO str2 ONE { }
        | ZERO ONE { };
n1 : NL {return 0;};

%%

int main()
{
    printf("enter the string");
    yyparse();
    if(flag ==0)
    {
        printf("strng match");
    }
    return 0;
}   

void yyerror()
{
    printf("strinng not match");
    flag =1;
}