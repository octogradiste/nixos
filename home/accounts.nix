{ ... }:
{
  accounts.email = {
    maildirBasePath = "mails";
    accounts = {
      "epfl" = {
        address = "colin.berger@epfl.ch";
        userName = "colin.berger@epfl.ch";
        realName = "Colin Berger";
        imap = {
          host = "outlook.office365.com";
          port = 993;
          tls.enable = true;
        };
        smtp = {
          host = "smtp.office365.com";
          port = 587;
          tls.enable = true;
        };
        thunderbird.enable = true;
      };
      "outlook" = {
        primary = true;
        address = "colin.berger@outlook.com";
        userName = "colin.berger@outlook.com";
        realName = "Colin Berger";
        imap = {
          host = "outlook.office365.com";
          port = 993;
          tls.enable = true;
        };
        smtp = {
          host = "smtp-mail.outlook.com";
          port = 587;
          tls.enable = true;
        };
        thunderbird.enable = true;
      };
      "infomaniak" = {
        address = "colin.berger@ik.me";
        userName = "colin.berger@ik.me";
        realName = "Colin Berger";
        imap = {
          host = "mail.infomaniak.com";
          port = 993;
          tls.enable = true;
        };
        smtp = {
          host = "mail.infomaniak.com";
          port = 465;
          tls.enable = true;
        };
        thunderbird.enable = true;
      };
    };
  };
}
