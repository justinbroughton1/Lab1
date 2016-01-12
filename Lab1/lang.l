%{
//**************************************
// lang.l
//
// Scanner definition file for CST 320 project
//
// Author: Phil Howard 
// phil.howard@oit.edu
//
// Date: Nov. 23, 2015
//

#include "tokens.h"

#define DO_RETURN(a) return (a)
//#define DO_RETURN(a) return Return(a)
int Return(int val);

%}

%option noyywrap
%option noinput
%option nounput
%option yylineno


    /* definitions go here. period is an example. */
period          ['.']
left_paran      ['(']
right_paran     [')']
left_curly      ['{']
right_curly     ['}']
left_bracket    ['[']
right_bracket   ['\]']
semicolon       [';']
comma           [',']
plus            ['+']
minus           ['\-']
mult            ['*']
div             ['/']
percent         ['%']
equals          ['=']
%%

    // token definitions go here. "if" is an example.
"if"                        DO_RETURN(IF);
"endif"                     DO_RETURN(ENDIF);
"else"                      DO_RETURN(ELSE);
"while"                     DO_RETURN(WHILE);
"print"                     DO_RETURN(PRINT);
"char"                      DO_RETURN(CHAR);
"int"                       DO_RETURN(INT);
"float"                     DO_RETURN(FLOAT);
"struct"                    DO_RETURN(STRUCT);
"return"                    DO_RETURN(RETURN);

"=="                        DO_RETURN(EQUALS);
"&&"                        DO_RETURN(AND);
"||"                        DO_RETURN(OR);

[a-zA-Z][a-zA-Z0-9]*        DO_RETURN(IDENTIFIER);
[1-9][0-9]*\.[0-9]*[1-9]    DO_RETURN(FLOAT_VAL);
[1-9][0-9]*                 DO_RETURN(INT_VAL);

{period}                    DO_RETURN(yytext[0]); 
{left_paran}                DO_RETURN(yytext[0]); 
{right_paran}               DO_RETURN(yytext[0]); 
{left_curly}                DO_RETURN(yytext[0]); 
{right_curly}               DO_RETURN(yytext[0]); 
{right_bracket}             DO_RETURN(yytext[0]); 
{semicolon}                 DO_RETURN(yytext[0]); 
{comma}                     DO_RETURN(yytext[0]); 
{plus}                      DO_RETURN(yytext[0]); 
{mult}                      DO_RETURN(yytext[0]); 
{div}                       DO_RETURN(yytext[0]); 
{percent}                   DO_RETURN(yytext[0]); 
{equals}                    DO_RETURN(yytext[0]);
{left_bracket}              DO_RETURN(yytext[0]);
{minus}                     DO_RETURN(yytext[0]); 

[ \t\r\n]                   {};
"//".*$                     {};
.                           DO_RETURN(JUNK_TOKEN);

%%

// This function allows us to do extra processing on each token
int Return(int val)
{
    printf("Scanned '%s': %d\n", yytext, val);
    return val;
}

