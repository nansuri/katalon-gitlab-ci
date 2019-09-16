// For testing purposes
// Edited by Riza P Nansuri

var json_loc = process.argv[2];
var report_output_loc = process.argv[3];
var test_suite = process.argv[4];
var browser_type = process.argv[5];
var browser;

var today = new Date();
var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
var dayName;
var day = today.getDay();

// Reporter

const report = require('multiple-cucumber-html-reporter');

switch (browser_type) {
    case 1:
        browser = 'chrome';
        break;
    case 2:
        browser = 'chrome';
        break;
    case 3:
        browser = 'firefox';
        break;
    default:
        browser = 'chrome';
        break;
}

// Date Generator


switch(day) {
    case 1:
        dayName="Monday";
        break;
    case 2:
        dayName="Tuesday";
        break;
    case 3:
        dayName="Wednesday";
        break;
    case 4:
        dayName="Thursday";
        break;
    case 5:
        dayName="Friday";
        break;
    case 6:
        dayName="Saturday";
        break;
    case 7:
        dayName="Sunday";
        break;
}

var dateTime = dayName+', '+time+' '+date;
// console.log(dateTime)

// Report properties

report.generate({
    pageTitle: "Fintech TE Automation Reporter",
    reportName: "Fintech TE Automation Reporter - "+test_suite, 
    jsonDir: json_loc,
    reportPath: report_output_loc,
    displayDuration: true,
    pageFooter: "<div><p><center>Fintech Test Engineer Report Generator @2019</center></p></div>",
    metadata:{
        browser: {
            name: browser
        },
        device: 'Local PC',
        platform: {
            name: 'Ubuntu'
        }
    },
    customData: {
        title: 'Run info',
        data: [
            {label: 'Test Suite', value: test_suite},
            {label: 'Cycle', value: 'Regression'},
            {label: 'Execution Start Time', value: dateTime}, 
        ]
    }
});