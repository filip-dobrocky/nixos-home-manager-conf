{ lib, pkgs, ... }:
{
    fileSystems."/run/media/filip/data" = {
        device = "/dev/disk/by-uuid/C8C4B6A4C4B69462";
        options = ["nofail"];
    };
}