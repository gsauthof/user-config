// better defaults for about:config
//
// Has to be linked from the actual firefox profile directory.
// For example from: ~/.mozilla/firefox/abcd1234.default
// 
// alternatively, manually apply them using the internal about:config page

// open URL present in the paste buffer
// enabled by default on Linux, but only in Firefox < 57
user_pref("middlemouse.contentLoadURL", true);

// do NOT open link in new tab when it's middle-clicked
// which easily happens by accident ...
user_pref("browser.tabs.opentabfor.middleclick", false);

// don't mess with user enetered addresses (e.g. non-full-qualified ones)
user_pref("browser.fixup.alternate.enabled", false);
// disable search suggestions while typing the search query
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.startup.homepage", "about:blank");
user_pref("browser.tabs.warnOnClose", false);
// don't send words entered in the url edit box to google
user_pref("keyword.enabled", false);
// allow cookies from originating server only
user_pref("network.cookie.cookieBehavior", 1);
user_pref("print.print_duplex", 1);

user_pref("privacy.donottrackheader.enabled", true);
user_pref("privacy.trackingprotection.enabled", true);
// privacy.trackingprotection.introCount 20

// legacy
// security.enable_java false
// security.warn_viewing_mixed false

