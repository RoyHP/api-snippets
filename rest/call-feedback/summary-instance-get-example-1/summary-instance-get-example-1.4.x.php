<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Services_Twilio($sid, $token);

// Get an object from its sid. If you do not have a sid,
// check out the list resource examples on this page
$summary = $client->account->calls->feedback_summary->get("FSa346467ca321c71dbd5e12f627deb854");
echo $summary->date_created;
