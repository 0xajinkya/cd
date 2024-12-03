%{
#include <stdio.h>
int flag =0 ;
%}

%{
int yylex();
void yyerror();
%}

%token NUMBER
%left '+' '-'
%left '*''/''%'
%left '('')'

%%
ArithmaticExpression: E {
    printf("result is %d",$$);
    return 0;
}

E: E '+' E {$$ = $1 + $3;}
|E '-' E {$$ = $1 - $3;}
|E '/' E {$$ = $1 / $3;}
|E '*' E {$$ = $1 * $3;}
|E '%' E {$$ = $1 % $3;}
|'(' E ')' {$$ =  $2;}
|NUMBER {$$ = $1;}
 ;
%%

void main()
{
    printf("enter the expression");
    yyparse();

    if(flag ==0)
    {
        printf("expresion is valid");
    }

}

void yyerror()
{
    printf("expression is invalid");
    flag = 1;
}