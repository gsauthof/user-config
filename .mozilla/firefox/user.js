// better defaults for about:config
//
// Has to be linked from the actual firefox profile directory.
// For example from: ~/.mozilla/firefox/abcd1234.default
// 
// cf. https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/A_brief_guide_to_Mozilla_preferences#Preferences_files
//
// alternatively, manually apply them using the internal about:config page
//
// cf. about:support -> Important Modified Perferences

// open URL present in the paste buffer
// enabled by default on Linux, but only in Firefox < 57
user_pref("middlemouse.contentLoadURL", true);
// do NOT open link in new tab when it's middle-clicked
// which easily happens by accident ...
user_pref("browser.tabs.opentabfor.middleclick", false);

// disable link-following for HTML accesskeys
user_pref("accessibility.accesskeycausesactivation", false);

user_pref("browser.download.useDownloadDir", false);

// don't mess with user entered addresses (e.g. non-full-qualified ones)
user_pref("browser.fixup.alternate.enabled", false);
// disable search suggestions while typing the search query
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.startup.homepage", "about:blank");
// restore previous session on startup (instead of showing a blank-/homepage)
user_pref("browser.startup.page", 3);
user_pref("browser.tabs.warnOnClose", false);
// don't send words entered in the url edit box to google
user_pref("keyword.enabled", false);
// allow cookies from originating server only
user_pref("network.cookie.cookieBehavior", 1);

user_pref("print.print_duplex", 1);
// Save some toner/ink
user_pref("print.print_bgcolor", false);
user_pref("print.print_bgimages", false);

// the do-not-track header is just a hint, it's probably widely ignored,
// thus, it effectively just adds entropy to the browser's fingerprint
// cf. https://en.wikipedia.org/wiki/Do_Not_Track
user_pref("privacy.donottrackheader.enabled", false);
user_pref("privacy.trackingprotection.enabled", true);
// disable display of the tracking-protection tour in fresh firefox installs
// privacy.trackingprotection.introCount 20
// disable exceptions to tracking protection
// according to mozilla these 'exceptions [are] required to avoid major website breakage'
// however, after years of usage the author of this file didn't notice any breakage,
// thus, keeping those exceptions disabled
user_pref("privacy.trackingprotection.allow_list.baseline.enabled"    , false);
user_pref("privacy.trackingprotection.allow_list.convenience.enabled" , false);


// choose what to block, i.e. Trackers and Cookies - in all windows
user_pref("browser.contentblocking.category", "custom");

// reduce cookie banners
// 1: reject; 2: reject and fall back to accept
// cf. https://github.com/mozilla/cookie-banner-rules-list
user_pref("cookiebanners.service.mode", 2);
user_pref("cookiebanners.service.mode.privateBrowsing", 1);

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


// disable sending location to mozilla servers periodically for
// displaying sponsored weather service ads
user_pref("browser.newtabpage.activity-stream.feeds.weatherfeed", false);
user_pref("browser.newtabpage.activity-stream.showWeather", false);
// disable more sponsored stuff
user_pref("browser.newtabpage.activity-stream.showSearch"               , false);
user_pref("browser.newtabpage.activity-stream.showSponsored"            , false);
user_pref("browser.newtabpage.activity-stream.showSponsoredCheckboxes"  , false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites"    , false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites"           , false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories" , false);


// Disable ridiculous tracking for advertisers ('adtech') feature Firefox
// introduced in version 128
// cf. newspeak announcement: https://support.mozilla.org/en-US/kb/privacy-preserving-attribution
// https://gitlab.torproject.org/tpo/applications/tor-browser/-/issues/42687
// https://utcc.utoronto.ca/~cks/space/blog/web/FirefoxStaticPrefsSystem
user_pref("dom.private-attribution.submission.enabled", false);


// disable proactive DNS requests for domain names you haven't requested (yet)
// i.e. which may unnecessarily leak sensitive information
user_pref("network.dns.disablePrefetch", true);
// similar feature for other connections
user_pref("network.predictor.enabled", false);
// disable internationalized domains, cf. punycode
user_pref("network.enableIDN", false);

// How many closed windows Firefox remembers under
// History -> Recently Closed Windows
// The default of 3 windows is too small
// (scenario: you have one important window and 3 unimportant ones,
//    you close the important one first, then realize that there are 3 left,
//    you close them as well, after restart you realize that you should have quit
//    Firefox with Ctrl+Q instead because that would have let you to
//    restore the session with all windows, but now the important window
//    can't be restored, anymore ...)
user_pref("browser.sessionstore.max_windows_undo", 10);

// Keep checking for and loading chrome/{userChrome.css,userContent.css}
// (default changed from true to false in Firefox 69)
// cf. https://bugzilla.mozilla.org/show_bug.cgi?id=1541233
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// click to play
// i.e. disables mouse-over/scroll auto-play
// cf. https://wiki.mozilla.org/Media/block-autoplay
user_pref("media.autoplay.blocking_policy", 2);

// don't auto-play audio/video/muted video, by default
// cf. https://utcc.utoronto.ca/~cks/space/blog/web/FirefoxMediaAutoplaySettingsIII
user_pref("media.autoplay.default", 5);


// disable 'AI' crap
// cf. https://firefox-source-docs.mozilla.org/toolkit/components/ml/
// https://firefox-source-docs.mozilla.org/toolkit/components/ml/extensions.html
// https://www.omgubuntu.co.uk/2025/08/firefox-high-cpu-usage-inference-disable
// https://www.omgubuntu.co.uk/2025/04/firefox-nightly-introduces-experimental-link-previews-with-ai-summary
user_pref("browser.ml.chat.enabled"               , false);
user_pref("browser.ml.chat.shortcuts"             , false);
user_pref("browser.ml.chat.shortcuts.custom"      , false);
user_pref("browser.ml.chat.sidebar"               , false);
user_pref("browser.ml.enable"                     , false);
user_pref("browser.ml.linkPreview.enabled"        , false);
user_pref("extensions.ml.enabled"                 , false);
user_pref("browser.tabs.groups.smart.enabled"     , false);
user_pref("browser.tabs.groups.smart.optin"       , false);
user_pref("browser.tabs.groups.smart.userEnabled" , false);


// improve usability of scrollbars
user_pref("widget.gtk.overlay-scrollbars.enabled"   , false);
user_pref("layout.css.scrollbar-width-thin.disabled", true );

// disable automatically filling in credit card and payment methods
user_pref("extensions.formautofill.creditCards.enabled", false);
// disable screenshot feature
user_pref("screenshots.browser.component.enabled", false);



