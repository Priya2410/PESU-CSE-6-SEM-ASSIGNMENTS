
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INCLUDE = 258,
     HEADER = 259,
     NUM = 260,
     EQCOMP = 261,
     GREATEREQ = 262,
     LESSEREQ = 263,
     NOTEQ = 264,
     INC = 265,
     DEC = 266,
     OROR = 267,
     ANDAND = 268,
     NOT = 269,
     INT = 270,
     CHAR = 271,
     FLOAT = 272,
     DOUBLE = 273,
     VOID = 274,
     WHILE = 275,
     FOR = 276,
     DO = 277,
     IF = 278,
     ELSE = 279,
     MAIN = 280,
     ID = 281,
     STRLITERAL = 282,
     CHARLITERAL = 283,
     REDUCE = 284
   };
#endif
/* Tokens.  */
#define INCLUDE 258
#define HEADER 259
#define NUM 260
#define EQCOMP 261
#define GREATEREQ 262
#define LESSEREQ 263
#define NOTEQ 264
#define INC 265
#define DEC 266
#define OROR 267
#define ANDAND 268
#define NOT 269
#define INT 270
#define CHAR 271
#define FLOAT 272
#define DOUBLE 273
#define VOID 274
#define WHILE 275
#define FOR 276
#define DO 277
#define IF 278
#define ELSE 279
#define MAIN 280
#define ID 281
#define STRLITERAL 282
#define CHARLITERAL 283
#define REDUCE 284




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


