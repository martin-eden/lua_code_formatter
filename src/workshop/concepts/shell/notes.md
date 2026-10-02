### Bash strings

Well, this framework assumes Linux and has facilities to execute
string as shell command.

"Shell" is stand-alone language.

It uses special characters like `>` to make fancy stuff.

Here we don't want fancy stuff. We want to pass data as we see it,
as array of bytes. We need "quoting" or "escaping".

According to `man bash`, Bash shell has three quoting modes:

  * In-place quoting

    `\` preserves next character..

    If it is not newline. If it is newline, it eats backslash and that
    newline.

  * External non-nested quoting

    * Apostrophe

      `'` preserves following characters until next `'`

    * Quotes

      `"` preserves some following characters until next `"`.

      It does magic if data contains `$`, backtick, `\` and maybe `!`.

      Looks like this is for hand-written code, when you want fancy
      output with substitutions.

From our perspective most suitable way for our task is apostrophe-quotes.

One-character `\` quote has advantage that quoted text is cuttable:
almost any substring of quoted text is quoted text.

But in typical case of quoting file names with spaces, `\ ` everywhere
is annoying.

If data does not contain `'`, we'll just surround it with `'`.

However if it does contain `'`, we need to split it before and after
`'` and concatenate with quoted `'`:

   `a'b` -> `a\'b` or `a"'"b`

-- Martin, 2026-06-09
