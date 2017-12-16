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

// we don't want to give Mozilla a carte blanche for installing
// any addon they feel like without further opt-in
// yes, it's enabled, by default, in Firefox 57
// case in point:
// https://bugzilla.mozilla.org/show_bug.cgi?id=1423003
// https://bugzilla.mozilla.org/show_bug.cgi?id=1424977
// https://bugzilla.mozilla.org/show_bug.cgi?id=1425171
// https://bugzilla.mozilla.org/show_bug.cgi?id=1425187
// https://support.mozilla.org/en-US/questions/1194583
// https://www.reddit.com/r/firefox/comments/7jh9rv/what_is_looking_glass/
// http://www.businessinsider.com/firefoxs-mr-robot-marketing-stunt-goes-wrong-users-think-they-downloaded-virus-2017-12
user_pref("app.shield.optoutstudies.enabled", false);

// do we really trust mozilla enough to phone home for a more and more
// incomprehensive list of things?
// master kill switch
// https://bugzilla.mozilla.org/show_bug.cgi?id=1195552#c4
user_pref("datareporting.policy.dataSubmissionEnabled", false);

// more specific
// user_pref("datareporting.healthreport.uploadEnabled", false);
// also disable local collection
// user_pref("toolkit.telemetry.enabled", false);


// legacy
// security.enable_java false
// security.warn_viewing_mixed false

