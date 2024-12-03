%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    
    int yylex();
    void yyerror(const char *s);
%}

%union {
    char vname[10];
    int val;
}

%token <vname> NAME
%type <vname> expression

%left '+' '-'
%left '*' '/'

%%

input:
      line '\n' input
    | '\n' input
    | 
    ;

line:
      NAME '=' expression {
          printf("MOV %s, AX \n", $1);
      }
    ;

expression:
      NAME '+' NAME {
          printf("MOV AX, %s\n", $1);
          printf("ADD AX, %s", $3);
      }
    | NAME '-' NAME {
          printf("MOV AX, %s\n", $1);
          printf("SUB AX, %s", $3);
      }
    | NAME '*' NAME {
          printf("MOV AX, %s\n", $1);
          printf("MUL AX, %s", $3);
      }
    | NAME '/' NAME {
          printf("MOV AX, %s\n", $1);
          printf("DIV AX, %s", $3);
      }
    | NAME {
          printf("MOV AX, %s\n", $1);
          strcpy($$, $1);
      }
    ;

%%

int main() {
    printf("Give me the input: ");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "%s", s);
}
