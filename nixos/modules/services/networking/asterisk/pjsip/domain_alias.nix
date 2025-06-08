{ lib, ... }:

{
  options.services.asterisk.settings.pjsip."domain_alias" = mkOption {
    type = types.attrsOf (types.submodule {
      options = {
        type = mkOption {
          type = types.str;
          default = "domain_alias";
          description = "Must be of type domain_alias.";
        };

        domain = mkOption {
          type = types.str;
          default = "";
          description = "The domain name to be aliased.";
        };
      };
    });
    description = "PJSIP domain_alias configuration for Asterisk.";
  };
}
