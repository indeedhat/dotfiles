const STANDALONE_SETTINGS_STORAGE_KEY = 'options.standalone';

function get_options() {
    chrome.runtime.getBackgroundPage(bgPage => {

        if (bgPage['KWisStandalone'] === true) {
            document.querySelector('input#standalone').checked = true
        } else if (bgPage['KWisStandalone'] === false) {
            document.querySelector('input#desktop').checked = true
        } else {
            console.error('Unable to read current Extension Mode')
        }
    })
}

// Saves options to chrome.storage
function save_options(evt) {
    evt.preventDefault();

    chrome.storage.local.get(STANDALONE_SETTINGS_STORAGE_KEY, res => {
        var previousMode = res[STANDALONE_SETTINGS_STORAGE_KEY];
        var userSelectedValue =  document.querySelector('input[name="standalone"]:checked').value;
        if (userSelectedValue) {
            var isStandalone = userSelectedValue === 'true';
            var hasSwitchedExtensionMode = previousMode && previousMode !== isStandalone;
            chrome.storage.local.set({
                'options.standalone': isStandalone,
                'hasSwitchedExtensionMode': hasSwitchedExtensionMode,
            }, () => chrome.runtime.reload());
        }
    })

}

function getVersionInfo() {
    chrome.runtime.getBackgroundPage(backgroundPage => {
        const versionInfo = backgroundPage.backgroundController.getVersionInfo()
        document.getElementById('short_version_info').textContent = "v" + versionInfo.versions.extension + " / " + versionInfo.mode
        document.getElementById('full_version_info').textContent = "Version Info:\n" + JSON.stringify(versionInfo, null, 4)
    })
}

function showFullVersionInfo() {
    document.getElementById('short_version_info').style.display = "none";
    document.getElementById('full_version_info').style.display = "block";
}

get_options();
document.getElementById('options_form').addEventListener('submit', save_options);
getVersionInfo();
document.getElementById('short_version_info').addEventListener('click', showFullVersionInfo);
