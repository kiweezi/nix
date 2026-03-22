{ config, lib, ... }:

{
    # European locale settings, UTC+1 time zone, and English (UK) as the default locale.
    time.timeZone = "Europe/Amsterdam";
    i18n.defaultLocale = "en_GB.UTF-8";
    # Use US keyboard layout.
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };
}