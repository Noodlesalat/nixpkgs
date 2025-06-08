{ lib, ... }:

{
  options.services.asterisk.settings.pjsip."global" = mkOption {
    type = types.attrsOf (types.submodule {
      options = {
        type = mkOption {
          type = types.str;
          default = "global";
          description = "Must be of type global.";
        };

        max_forwards = mkOption {
          type = types.int;
          default = 70;
          description = "Value used in Max Forwards header for SIP requests.";
        };

        user_agent = mkOption {
          type = types.str;
          default = "";
          description = "Value used in User Agent header for SIP requests and Server header for SIP responses. Defaults to Asterisk Version.";
        };

        default_outbound_endpoint = mkOption {
          type = types.str;
          default = "default_outbound_endpoint";
          description = "Endpoint to use when sending an outbound request to a URI without a specified endpoint.";
        };
      };
    });
    description = "Global SIP communication options for PJSIP in Asterisk.";
  };
}
