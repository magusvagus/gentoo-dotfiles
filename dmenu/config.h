/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"DepartureMono Nerd Font:size=18"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#ffffff", "#121212" },
	[SchemeSel] = { "#ffffff", "#121212" },
	[SchemeOut] = { "#ffffff", "#121212" },

	// [SchemeNorm] = { "#f8f8f2", "#282a36" },
	// [SchemeSel] = { "#f8f8f2", "#6272a4" },
	// [SchemeOut] = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";


// borders dmenu patch VVV
/* Size of the window border */
static const unsigned int border_width = 2;
// borders dmenu patch |||
