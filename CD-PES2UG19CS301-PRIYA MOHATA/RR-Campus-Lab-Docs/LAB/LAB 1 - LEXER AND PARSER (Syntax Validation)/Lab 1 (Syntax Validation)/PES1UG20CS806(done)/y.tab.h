
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
     INT = 258,
     FLOAT = 259,
     DOUBLE = 260,
     CHAR = 261,
     STATIC = 262,
     ID = 263,
     INCLUDE = 264,
     HEADER = 265,
     MAIN = 266,
     DO = 267,
     WHILE = 268,
     IF = 269,
     ELSE = 270,
     FOR = 271,
     BOOL = 272,
     BREAK = 273,
     INC = 274,
     DEC = 275,
     STRLIT = 276,
     VNUM = 277,
     LT = 278,
     GT = 279,
     GTE = 280,
     LTE = 281,
     EQ = 282,
     NE = 283,
     OR = 284,
     AND = 285,
     LNOT = 286,
     SCOMB = 287,
     ECOMB = 288,
     SSQB = 289,
     ESQB = 290,
     SCURB = 291,
     ECURB = 292
   };
#endif
/* Tokens.  */
#define INT 258
#define FLOAT 259
#define DOUBLE 260
#define CHAR 261
#define STATIC 262
#define ID 263
#define INCLUDE 264
#define HEADER 265
#define MAIN 266
#define DO 267
#define WHILE 268
#define IF 269
#define ELSE 270
#define FOR 271
#define BOOL 272
#define BREAK 273
#define INC 274
#define DEC 275
#define STRLIT 276
#define VNUM 277
#define LT 278
#define GT 279
#define GTE 280
#define LTE 281
#define EQ 282
#define NE 283
#define OR 284
#define AND 285
#define LNOT 286
#define SCOMB 287
#define ECOMB 288
#define SSQB 289
#define ESQB 290
#define SCURB 291
#define ECURB 292




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


