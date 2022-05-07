
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
     FOR = 262,
     WHILE = 263,
     IF = 264,
     ELSE = 265,
     INCLUDE = 266,
     MAIN = 267,
     ID = 268,
     NUMBER = 269,
     HEADER = 270,
     GREATEREQ = 271,
     LESSEREQ = 272,
     EQCOMP = 273,
     NOTEQ = 274,
     INC = 275,
     DEC = 276,
     ANDAND = 277,
     OROR = 278
   };
#endif
/* Tokens.  */
#define INT 258
#define FLOAT 259
#define DOUBLE 260
#define CHAR 261
#define FOR 262
#define WHILE 263
#define IF 264
#define ELSE 265
#define INCLUDE 266
#define MAIN 267
#define ID 268
#define NUMBER 269
#define HEADER 270
#define GREATEREQ 271
#define LESSEREQ 272
#define EQCOMP 273
#define NOTEQ 274
#define INC 275
#define DEC 276
#define ANDAND 277
#define OROR 278




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


