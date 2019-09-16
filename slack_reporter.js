// var url = "https://hooks.slack.com/services/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"

// var slack_mention = "<@UGZL94Q5P>"
var url = process.argv[2];
var test_suite = process.argv[3];
var execution_status = process.argv[4];
var execution_color;
var slack_id;
var commiter = process.argv[5];
var exposed_link = process.argv[6];
var execution_text;
// var commiter = "rIza-v3.2";


if(execution_status==1){
    execution_color="#FF0000"
    execution_text="Test Failed"
} else {
    execution_color="#00ff00"
    execution_text="Test Success" 
}

const splitString = commiter.split("-");
var commiter_slack = splitString[0].toLowerCase();
// console.log(commiter_slack)

switch(commiter_slack) {
    case "rizap":
        slack_id="@UGZL94Q5P";
        break;
    case "dewi":
        slack_id="@UHH67G2N9";
        break;
    case "maulana":
        slack_id="@U63TKTFK6";
        break;
    case "riki":
        slack_id="@U4PUT9YNN";
        break;
    case "caroline":
        slack_id="@U322QMN10";
        break;
    default:
        slack_id="!here"
        break;
}

const { IncomingWebhook } = require('@slack/webhook'); 
const webhook = new IncomingWebhook(url);
 
// Send the notification
(async () => {
  await webhook.send({
        "attachments": [
            {
                "color": execution_color,
                "pretext": "hi <" +slack_id+"> your Gitlab jobs is done.",
                "author_name": "Gitlab CI",
                "title": execution_text,
                "text": "Test Suite executed : ",
                "fields": [
                    {
                        "title": test_suite,
                        "short": false
                    }
                ],
                "actions": [
                    {
                        "name": "Action",
                        "text": "See Report",
                        "type": "button",
                        "url" : exposed_link,
                        "style": "primary",
                        "value": "see_report"
                    },
                ],
                "mrkdwn_in": [
                    "text",
                    "pretext"
                ]
            }
        ]
    }
    );
})();