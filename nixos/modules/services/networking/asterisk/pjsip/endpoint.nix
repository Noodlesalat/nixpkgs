{ lib, ... }:

{
  options.services.asterisk.settings.pjsip."endpoint" = mkOption {
    type = types.attrsOf (types.submodule {
      options = {
        type = mkOption {
          type = types.str;
          default = "endpoint";
          description = "Must be of type endpoint.";
        };

        "100rel" = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "yes";
          description = "Support RFC3262 provisional ACK.";
        };

        aggregate_mwi = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "yes";
          description = "Aggregate Message Waiting Indicators.";
        };

        allow = mkOption {
          type = types.str;
          default = "";
          description = "Allowed media codecs.";
        };

        aors = mkOption {
          type = types.str;
          default = "";
          description = "Associated Address-of-Record(s).";
        };

        auth = mkOption {
          type = types.str;
          default = "";
          description = "Authentication object.";
        };

        callerid = mkOption {
          type = types.str;
          default = "";
          description = "CallerID string.";
        };

        callerid_privacy = mkOption {
          type = types.str;
          default = "";
          description = "Privacy level.";
        };

        callerid_tag = mkOption {
          type = types.str;
          default = "";
          description = "Internal ID tag.";
        };

        context = mkOption {
          type = types.str;
          default = "default";
          description = "Dialplan context.";
        };

        direct_media = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "yes";
          description = "Enable direct media between endpoints.";
        };

        direct_media_method = mkOption {
          type = types.str;
          default = "invite";
          description = "Direct media method.";
        };

        direct_media_glare_mitigation = mkOption {
          type = types.str;
          default = "none";
          description = "Mitigation of glare with direct media reINVITE.";
        };

        disable_direct_media_on_nat = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Disable direct media with NAT.";
        };

        disallow = mkOption {
          type = types.str;
          default = "";
          description = "Disallowed media codecs.";
        };

        dtmf_mode = mkOption {
          type = types.str;
          default = "rfc4733";
          description = "DTMF signaling method.";
        };

        external_media_address = mkOption {
          type = types.str;
          default = "";
          description = "Public IP for media.";
        };

        force_rport = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "yes";
          description = "Force use of return port.";
        };

        ice_support = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Enable ICE support for NAT traversal.";
        };

        identify_by = mkOption {
          type = types.str;
          default = "username";
          description = "Identification method.";
        };

        mailboxes = mkOption {
          type = types.str;
          default = "";
          description = "Associated mailboxes.";
        };

        moh_suggest = mkOption {
          type = types.str;
          default = "default";
          description = "Suggested Music On Hold class.";
        };

        outbound_auth = mkOption {
          type = types.str;
          default = "";
          description = "Outbound authentication object.";
        };

        outbound_proxy = mkOption {
          type = types.str;
          default = "";
          description = "Outbound SIP proxy.";
        };

        rewrite_contact = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Rewrite Contact header with source IP/port.";
        };

        rtp_ipv6 = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Enable IPv6 for RTP.";
        };

        rtp_symmetric = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Enforce symmetric RTP.";
        };

        send_diversion = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "yes";
          description = "Send SIP Diversion header.";
        };

        send_pai = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Send P-Asserted-Identity header.";
        };

        send_rpid = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Send Remote-Party-ID header.";
        };

        timers = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "yes";
          description = "Enable session timers.";
        };

        timers_min_se = mkOption {
          type = types.str;
          default = "90";
          description = "Minimum session timer.";
        };

        timers_sess_expires = mkOption {
          type = types.str;
          default = "1800";
          description = "Maximum session expiration.";
        };

        transport = mkOption {
          type = types.str;
          default = "";
          description = "SIP transport to use.";
        };

        trust_id_inbound = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Trust inbound identity.";
        };

        trust_id_outbound = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Send outbound identity.";
        };

        use_ptime = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Use endpoint's packetization time.";
        };

        use_avpf = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Use AVPF for this endpoint.";
        };

        media_encryption = mkOption {
          type = types.enum [ "no" "sdes" "dtls" ];
          default = "no";
          description = "Enable media encryption.";
        };

        inband_progress = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Enable inband progress.";
        };

        call_group = mkOption {
          type = types.str;
          default = "";
          description = "Numeric call pickup group.";
        };

        pickup_group = mkOption {
          type = types.str;
          default = "";
          description = "Numeric pickup group.";
        };

        named_call_group = mkOption {
          type = types.str;
          default = "";
          description = "Named call group.";
        };

        named_pickup_group = mkOption {
          type = types.str;
          default = "";
          description = "Named pickup group.";
        };

        device_state_busy_at = mkOption {
          type = types.str;
          default = "0";
          description = "Busy threshold.";
        };

        t38_udptl = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Enable T.38 faxing.";
        };

        fax_detect = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Enable CNG tone detection.";
        };

        t38_udptl_ec = mkOption {
          type = types.enum [ "none" "fec" "redundancy" ];
          default = "none";
          description = "T.38 error correction.";
        };

        t38_udptl_maxdatagram = mkOption {
          type = types.str;
          default = "0";
          description = "Max datagram size.";
        };

        t38_udptl_nat = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Enable NAT support for T.38.";
        };

        t38_udptl_ipv6 = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Enable IPv6 for T.38.";
        };

        tone_zone = mkOption {
          type = types.str;
          default = "";
          description = "Tone zone (country tones).";
        };

        language = mkOption {
          type = types.str;
          default = "";
          description = "Language setting.";
        };

        one_touch_recording = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Enable one-touch recording.";
        };

        record_on_feature = mkOption {
          type = types.str;
          default = "automixmon";
          description = "Feature to start recording.";
        };

        record_off_feature = mkOption {
          type = types.str;
          default = "automixmon";
          description = "Feature to stop recording.";
        };

        rtp_engine = mkOption {
          type = types.str;
          default = "asterisk";
          description = "RTP engine.";
        };

        allow_transfer = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "yes";
          description = "Allow SIP REFER transfers.";
        };

        sdp_owner = mkOption {
          type = types.str;
          default = "-";
          description = "SDP owner username.";
        };

        sdp_session = mkOption {
          type = types.str;
          default = "Asterisk";
          description = "SDP session name.";
        };

        tos_audio = mkOption {
          type = types.str;
          default = "0";
          description = "DSCP TOS value for audio.";
        };

        tos_video = mkOption {
          type = types.str;
          default = "0";
          description = "DSCP TOS value for video.";
        };

        cos_audio = mkOption {
          type = types.str;
          default = "0";
          description = "802.1p priority for audio.";
        };

        cos_video = mkOption {
          type = types.str;
          default = "0";
          description = "802.1p priority for video.";
        };

        allow_subscribe = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "yes";
          description = "Allow presence subscriptions.";
        };

        sub_min_expiry = mkOption {
          type = types.str;
          default = "0";
          description = "Minimum subscription expiry.";
        };

        from_user = mkOption {
          type = types.str;
          default = "";
          description = "Username in From header.";
        };

        mwi_from_user = mkOption {
          type = types.str;
          default = "";
          description = "Username in From header for MWI.";
        };

        fromdomain = mkOption {
          type = types.str;
          default = "";
          description = "Domain in From header.";
        };

        dtls_verify = mkOption {
          type = types.str;
          default = "";
          description = "DTLS certificate verification.";
        };

        dtls_rekey = mkOption {
          type = types.str;
          default = "";
          description = "DTLS rekey interval.";
        };

        dtls_cert_file = mkOption {
          type = types.path;
          description = "Path to DTLS certificate.";
        };

        dtls_private_key = mkOption {
          type = types.path;
          description = "Path to private key.";
        };

        dtls_cipher = mkOption {
          type = types.str;
          default = "";
          description = "DTLS cipher suite.";
        };

        dtls_ca_file = mkOption {
          type = types.path;
          description = "CA certificate path.";
        };

        dtls_ca_path = mkOption {
          type = types.path;
          description = "CA directory path.";
        };

        dtls_setup = mkOption {
          type = types.str;
          default = "";
          description = "DTLS setup role.";
        };

        srtp_tag_32 = mkOption {
          type = types.enum [ "yes" "no" ];
          default = "no";
          description = "Use 32-byte SRTP tags.";
        };
      };
    });
    description = "PJSIP endpoint configuration for Asterisk.";
  };
}