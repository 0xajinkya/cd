# yacc -d grammar.y
# flex/lex lexer.l
# gacc y.tab.c lex.yy.c -o op -lfl
# ./op _parameter_id_any_
