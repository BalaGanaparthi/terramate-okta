resource "okta_template_email" "email-forgotPassword" {
  type = "email.forgotPassword"

  translations {
    language = "en"
    subject  = "Custom forgot password email subject"
    template = <<EOF
          <head>
          <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
          <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
          <style type="text/css">
          </style>
        </head>
        <body>
        <div style="background-color:#fafafa;margin:0">
          <table style="font-family:'proxima nova' , 'century gothic' , 'arial' , 'verdana' , sans-serif;font-size:14px;color:#5e5e5e;width:98%;max-width:600px;float:none;margin:0 auto" border="0" cellpadding="0" cellspacing="0" valign="top" align="left">
            <tbody>
              <tr align="middle">
                <td style="padding-top:30px;padding-bottom:32px"><img src="https://www1.domain.com/css/foundation/images/logo/desktop/domain.png" height="37" alt="Domain.com" /></td>
              </tr>
              <tr bgcolor="#ffffff">
                <td>
                  <table bgcolor="#ffffff" style="width:100%;line-height:20px;padding:32px;border:1px solid;border-color:#f0f0f0" cellpadding="0">
                    <tbody>
                      <tr>
                        <td style="color:#5e5e5e;font-size:22px;line-height:22px"> <p style="margin: 0;">Greetings.<br /><br />We recently received a request to reset the password for your Domain.com account.</p> </td>
                      </tr>
                      <tr>
                        <td align="center">
                          <table border="0" cellpadding="0" cellspacing="0" valign="top">
                            <tbody>
                              <tr>
                                <td align="center" style="height:32px;padding-top:24px;padding-bottom:8px"> <a id="reset-password-link" href="$${resetPasswordLink}" style="text-decoration:none"><span style="padding:9px 32px 7px 31px;border:1px solid;text-align:center;cursor:pointer;color:#fff;border-radius:3px;background-color:#44bc98;border-color:#328c71 #328c71 #2f856b;box-shadow:0 1px 0 #d8d8d8">Reset Password</span></a> <br /></td>
                                <a id="reset-password-link" href="$${resetPasswordLink}" style="text-decoration: none;"><span style="padding: 9px 32px 7px 31px; border: 1px solid; text-align: center; cursor: pointer; color: #fff; border-radius: 3px; background-color: $${brand.theme.primaryColor}; border-color: $${brand.theme.primaryColor}; box-shadow: 0 1px 0 $${brand.theme.primaryColor};">Reset Password</span></a>
                              </tr>
                              <tr>
                                <td align="center" style="color:#999"> <br>For security reasons, the link to change your password will expire in <b>$${resetPasswordTokenExpirationDate}</b> ($${resetPasswordTokenExpirationDate}).<br /><br />Thank you for using Domain.com! Have questions? Please contact Customer Support. We are happy to help.</p> </td>
                              </tr>
                            </tbody>
                          </table> </td>
                      </tr>
                    </tbody>
                  </table> </td>
              </tr>
              <tr>
                <td style="font-size:12px;padding:16px 0 30px 50px;color:#999" align="center" valign="top"> This is an automatically generated message from Domain.com. Replies are not monitored or answered.
                                          <br> If you did not expect to receive this email please contact your system administrator before proceeding.</td>
              </tr>
              <tr>
                <td style="font-size:12px;padding:16px 0 30px 50px;color:#999" align="center" valign="top"> ©2020 Domain.com</td>
              </tr>
            </tbody>
          </table>
        </div>
        </body>
        EOF
  }

}