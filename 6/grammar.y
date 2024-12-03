%{
    #include <stdio.h>
    int flag = 0;
%}

%token ONE ZERO TWO NL
%start q0

%%
q0:
    ZERO q0 {$$ = $2;}
    | ONE q1 {$$ = $2;}
    | TWO q2 {$$ = $2;}
    | NL {
        printf("no is divisible by 3");
        return 0;
    }
    ;

q1:
    ZERO q1 {$$ = $2;}
    | ONE q2 {$$ = $2;}
    | TWO q0 {$$ = $2;}
    | NL {
        printf("no is not divisible by 3");
        return 0;
    }
    ;

q2:
    ZERO q2 {$$ = $2;}
    | ONE q0 {$$ = $2;}
    | TWO q1 {$$ = $2;}
    | NL {
        printf("no is not divisible by 3");
        return 0;
    }
    ;

%%

int main()
{
    printf("enter the decimal no ");
    yyparse();
}

void yyerror()
{
    printf("\nEntered arithmetic expression is Invalid\n\n");
    flag = 1;
}
