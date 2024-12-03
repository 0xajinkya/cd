%{
#include <stdio.h>
FILE *fp;
%}

Binary      [0-1]+
Oct         [0-7]+
Dec         [0-9]+
Hex         [0-9A-F]+
Positive    [+]?[1-9][0-9]*
Negative    [-][1-9][0-9]*
PositiveF   [+]?[1-9][0-9]*\.[0-9]+
NegativeF   [-][1-9][0-9]*\.[0-9]+
Exponent    [-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?

%%

{Binary}    { printf("Binary number: %s\n", yytext); }
{Oct}       { printf("Octal number: %s\n", yytext); }
{Dec}       { printf("Decimal number: %s\n", yytext); }
{Hex}       { printf("Hexadecimal number: %s\n", yytext); }
{Positive}  { printf("Positive integer: %s\n", yytext); }
{Negative}  { printf("Negative integer: %s\n", yytext); }
{PositiveF} { printf("Positive floating-point: %s\n", yytext); }
{NegativeF} { printf("Negative floating-point: %s\n", yytext); }
{Exponent}  { printf("Exponential number: %s\n", yytext); }

%%

int main(int argc, char *argv[]) {
    if (argc > 1) {
        fp = fopen(argv[1], "r");
        if (fp != NULL) {
            yyin = fp;
            yylex();
            fclose(fp);
        } else {
            printf("Error: Unable to open file.\n");
        }
    } else {
        printf("Usage: ./a.out <input_file>\n");
    }
    return 0;
}
