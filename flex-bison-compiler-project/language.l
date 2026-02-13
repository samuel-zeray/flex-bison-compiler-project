%{
#include "language.tab.h"  // Include Bison-generated header
%}

%%

"if"            { printf("Token: IF\n"); return IF; }
"else"          { printf("Token: ELSE\n"); return ELSE; }
"int"           { printf("Token: INT\n"); return INT; }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Token: IDENTIFIER (%s)\n", yytext); return IDENTIFIER; }
[0-9]+          { printf("Token: NUMBER (%s)\n", yytext); return NUMBER; }
"+"             { printf("Token: PLUS\n"); return PLUS; }
"-"             { printf("Token: MINUS\n"); return MINUS; }
"*"             { printf("Token: MULTIPLY\n"); return MULTIPLY; }
"/"             { printf("Token: DIVIDE\n"); return DIVIDE; }
"="             { printf("Token: ASSIGN\n"); return ASSIGN; }
">"             { printf("Token: GT\n"); return GT; }
"<"             { printf("Token: LT\n"); return LT; }
"=="            { printf("Token: EQ\n"); return EQ; }
"!="            { printf("Token: NE\n"); return NE; }
";"             { printf("Token: SEMICOLON\n"); return SEMICOLON; }
"("             { printf("Token: LPAREN\n"); return LPAREN; }
")"             { printf("Token: RPAREN\n"); return RPAREN; }
"{"             { printf("Token: LBRACE\n"); return LBRACE; }
"}"             { printf("Token: RBRACE\n"); return RBRACE; }
[ \t\n]         ; // Ignore whitespace
.               { printf("Unknown token: %s\n", yytext); }

%%

int yywrap() {
    return 1;  // Indicates end of input
}
