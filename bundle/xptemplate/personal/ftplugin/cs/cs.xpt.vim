XPTemplate priority=lang-2

let s:f = g:XPTfuncs()

XPTvar $CS 		//
XPTvar $BRfun 	\n
XPTvar $BRret 	' '

XPTinclude
	\ _common/common

XPT NIE
throw new System.NotImplementedExecption(`string?^);

XPT class hint=class\ +ctor
`public?^ class `className^
{
	public `className^ (`$SParg^`ctorParam^`$SParg^)`$BRfun^{
		`cursor^
	}
}

XPT pclass alias=class " public class +ctor
XSET public?=Embed('public')

XPT ~ " class +dtor
`public?^ ~`classname^ ()
{
	`cursor^
}

XPT cw " Console.Write
Console.Write(`string^);

XPT cwl " Console.WriteLine
Console.Write(`string^);

XPT us " using cursor;
using `package^;

XPT uscg alias=us " using System.Collections.Generic;
XSET package=Embed('System.Collections.Generic')

XPT Attribute " attribute class
[(`SystemAttributeUsage^ (`SystemAttributeTargets^.`target^, Inherited = `inherited^, AllowMultiple = `allowmultiple^)]
public sealed class `name^Attribute : `SystemAttribute^
{
	readonly string positionalString;
	public string PositionString {
		get {
			return positionString;
		}
	}

	public int NamedInt { get; set; }

	public `name^Attribute (`SParg^string positionalString`SParg^)
	{
		this.positionalString = positionalString;

		`cursor^
	}
}

XPT ctor " class +ctor
`public?^ `classname^ ()
{
	`cursor^
}

XPT _csmain hidden
public `ret^ Main (`SParg^string [] arg`SParg^)
{
	`cursor^
}

XPT svm alias=_csmain " void Main method
XSET ret=Embed('void')

XPT sim " int Main method
XSET ret=Embed('int')

XPT indexer " indexer method
public `type^ this [`indextype^ index]`$SPfun^{`
    `get...{{^
    get { return `what^; }`}}^`
    `set...{{^
    set { `what^ = `value^; }`}}^
}

XPT propg " short property with private set
public `type^ `name^`$SPfun^{
	get; private set;
}

XPT EventArgs "event arguments
[`SystemSerializable^]
public sealed class `name^EventArgs : `SystemEventArgs^
{
	public `name^EventArgs ()`SPfun^{
		`cursor^
	}
}

XPT lst " Last element of a collection
`col^[`col^.Count - 1]

XPT checked wrap=what " checked block
checked 
{
	`what^
}

XPT unchecked wrap=what " unchecked block
unchecked 
{
	`what^
}

XPT unsafe wrap=what " unsafe block
unsafe 
{
	`what^
}

XPT lock wrap=what " lock statement
lock (`expression^)
{
	`what^
}
`cursor^

XPT type wrap=what " type cast
((`type^)`what^)


