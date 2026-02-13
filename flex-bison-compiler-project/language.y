%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);  // Declare yylex function
void yyerror(const char *s);  // Declare yyerror function
%}

%debug  // Enable debugging output for Bison

// Token declarations
%token IF ELSE INT IDENTIFIER NUMBER PLUS MINUS MULTIPLY DIVIDE ASSIGN SEMICOLON LPAREN RPAREN LBRACE RBRACE GT LT EQ NE

%%

program: statement | program statement;

statement: declaration 
         | if_statement 
         | assignment SEMICOLON;

declaration: INT IDENTIFIER ASSIGN expression SEMICOLON;

assignment: IDENTIFIER ASSIGN expression;  // Rule for assignments

if_statement: IF LPAREN condition RPAREN LBRACE statement RBRACE 
            | IF LPAREN condition RPAREN LBRACE statement RBRACE ELSE LBRACE statement RBRACE; // Allow optional else

condition: expression GT expression  // Greater than
         | expression LT expression  // Less than
         | expression EQ expression  // Equal to
         | expression NE expression; // Not equal to

expression: expression PLUS term 
          | expression MINUS term 
          | term;  // Ensure term can handle variables or numbers

term: term MULTIPLY factor 
     | term DIVIDE factor 
     | factor;

factor: NUMBER 
       | IDENTIFIER 
       | LPAREN expression RPAREN;

%%

int main(int argc, char **argv) {
    printf("Starting parsing...\n");
    yyparse();  // Start parsing the tokens
    printf("Parsing completed successfully!\n");
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error: %s\n", s);
    exit(1);  // Exit after error
}
