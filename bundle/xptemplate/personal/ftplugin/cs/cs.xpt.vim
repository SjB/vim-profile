XPTemplate priority=lang-2

let s:f = g:XPTfuncs()

XPTvar $CS 		//
XPTvar $BRfun 	\n
XPTvar $BRret 	' '

XPT NIE
throw new System.NotImplementedExecption(`string^);

XPT class hint=class\ +ctor
`private?^ class `className^
{
    public `className^(`$SParg^`ctorParam^`$SParg^)`$BRfun^{
        `cursor^
    }
}

XPT pclass alias=class " public class +ctor
XSET private?=Embed('public')

XPT cw " Console.Write
Console.Write(`string^);

XPT cwl " Console.WriteLine
Console.Write(`string^);

XPT us " using cursor;
using `package^;

XPT uscg alias=us " using System.Collections.Generic;
XSET package=Embed('System.Collections.Generic')
