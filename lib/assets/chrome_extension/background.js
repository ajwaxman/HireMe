// Copyright (c) 2011 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Called when the url of a tab changes.
function checkForValidUrl(tabId, changeInfo, tab) {
  // If the letter 'g' is found in the tab's URL...
  if ((tab.url.indexOf('http://jobs.37signals.com') == 0) || (tab.url.indexOf('http://www.indeed.com') == 0) || (tab.url.indexOf('https://jobs.github.com') == 0) || (tab.url.indexOf('https://coderwall.com') == 0) || (tab.url.indexOf('https://teamtreehouse.com') == 0) || (tab.url.indexOf('https://toprubyjobs.com') == 0)){
    // ... show the page action.
    chrome.pageAction.show(tabId);
  }
};

// Listen for any changes to the URL of any tab.
chrome.tabs.onUpdated.addListener(checkForValidUrl);