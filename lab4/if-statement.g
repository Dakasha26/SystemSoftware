/* Спасибо Halacky за консультации */
grammar Skvortsov;

/* Правила */
main: declaration* statement*;
statement : assign | ifelse;

ifelse : ifpart (elsepart statement*)?;
ifpart: If ifcondition ((LfBracket statement* RfBracket) | statement);
ifcondition: operands LogOp operands;
elsepart: Else LfBracket statement* RfBracket;

declaration: 
	typedata Ident (IdentSep Ident)* LineSep 
	| Typenumber Ident Prisv LineSep
	| Typereal   Ident Prisv LineSep  
	| Typechar   Ident Prisv LineSep  
	| Typebool   Ident Prisv LineSep;
	
assign: Ident Prisv operands LineSep statement*; 
arifmoperation: Ident ArifmOp operands
	| Ident ArifmOpExt
	| LbParam arifmoperation RbParam;
typedata: Typenumber | Typereal | Typechar | Typebool;

operands: Ident | arifmoperation;

/* Игнорирование лишнего */
WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;

/* Токены */
Typenumber : 'number';
Typereal : 'real';
Typechar : 'char';
Typebool : 'bool';

Exp: ('e'|'E') ('+'|'-')? ('0'..'9')+;	

ArifmOp: '+' | '-' | '*' | '/' ;
ArifmOpExt: '++' | '--';
LogOp: 'and' | 'or' | '==' | '>' | '<' | '!=' | '<=' | '>=';
LbParam: '(';
RbParam: ')';
LfBracket: '{';
RfBracket: '}';
LineSep: ';';
Prisv: '=';
IdentSep: ',';

If: 'if';
Else: 'else';
Ident: ('a'..'z'|'A'..'Z')('0'..'9')((('a'..'z'|'A'..'Z')*)|(('0'..'9')*));