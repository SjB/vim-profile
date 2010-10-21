XPTemplate priority=all-

let s:f = g:XPTfuncs()

fun! s:f.year(...) "{{{
	return strftime('%Y')
endfunction "}}}

XPTinclude
	\ _common/personal

XPT ncacopy
`$CS^
`$CS^ `file()^
`$CS^
`$CS^ Author:
`$CS^       `$author^ `$email^
`$CS^
`$CS^ Copyright (c) `year()^ The National Centre for Audiology
`$CS^
`$CS^ Licesed under The National Centre for Audiology, Version 1.0
`$CS^ (the "License"); you may not use this file except in compliance
`$CS^ with the License.  You may obtain a copy of teh License by contacting
`$CS^
`$CS^ The National Centre for Audiology
`$CS^ http://www.uwo.ca/nca
`$CS^
`$CS^ Unless required by applicable law or agreed to in writting
`$CS^ software distributed under the License is distributed on an "AS IS"
`$CS^ BASIS WITHOUT WARRANTIEDS OR CONDITIONS OF ANY KIND. either express
`$CS^ or implied.  See the License for the specific language governing
`$CS^ permissions and limitations under the licenses.
`$CS^
`cursor^

XPT sjbcopy
`$CS^
`$CS^ `file()^
`$CS^
`$CS^ Author:
`$CS^       `$author^ `$email^
`$CS^
`$CS^ Copyright (c) `year()^ `$author^
`$CS^
`cursor^


