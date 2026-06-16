### 2025-12-10 Archiving

Today I'm archiving this repo

I'm not "maintaining" my projects. I release them in ether with all
required code. I see no point in updating readme's, fixing typos,
adding tests and "evangelizing".

Lua is almost 5.5 today. Updating project with just syntax support
after eight years is not serious. Redoing it with updated code style,
redesign and documentation is noble but not sexy. Doing new is sexy.


This one I'm quite proud of. In 2016 I was writing something that
I named only lately. It's like "top-down recursive parser" in Lua.
Using tables to represent self-links.

I wanted to test it on something real. JSON occurred to be a toy
task. I did it on Lua syntax.

As everywhere there occurred to be more problems than just parsing
source to AST.

Devil in formatting code to fit screen. What I invented on the way
probably has quadratic complexity. But it worked for my practical
test set, even for like 25 MB Lua file with tables.

Another thing is "virtual printer". Today I would have redone it
with proper design. But it was written on-flight, when it feels that
you're on last mile.

Another thing is need to transform AST for more comfort structure
to write serializing routines. It is not documented.

And that parser which is core of this Golden Heart ship is not
documented too. But it is good. Grok it.

Comments are buggers. I still doubt it was right decision to keep
them and trying to embed in formatted output. I don't want to return
here mostly of them.


So now in 2025 I'm not employed, not playing World of Warcraft,
writing another pieces of good code for microcontrollers,
doing designs for CNC and 3D printers and quite happy.

-- Martin
