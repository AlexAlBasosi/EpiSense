if(location.search){
    var searchString = location.search;
    var stArr = searchString.split("=");
    var patientID = stArr[1];
    var doctorEmail = sessionStorage.getItem("loginEmail");
}

 var getTimestampsURL = "/patients/" + patientID + "/history/timestamps";

 var timeArray;

$.ajax({
  url: getTimestampsURL,
  type: 'GET',
  success: function(res) {
      dateArray = res;

      console.log(dateArray);
      var seizureArray = [];

      for(var i = 0; i < dateArray.length; i++){

        var numberOfSeizuresURL = "/patients/" + patientID + "/history/numberofseizuresbyday?date=" + dateArray[i];


        $.ajax({
            url: numberOfSeizuresURL,
            type: 'GET',
            success: function(res) {
                seizureArray.push(res);
            }, 
            async: false
        });

      }

        var labelArray = [];
        for(var i = 0; i < seizureArray.length; i++){
            labelArray.push("Day " + (i+1));
        }

        console.log(seizureArray);
        console.log(labelArray);

        var ctx = document.getElementById("lineChart").getContext('2d');
        ctx.canvas.width=ctx.canvas.originalwidth;
        ctx.canvas.height=ctx.canvas.originalheight;


        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labelArray,
                datasets: [{
                    label: 'Number of Seizures',
                    data: seizureArray,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

  }
});

var getTimestampsFullURL = "/patients/" + patientID + "/history/timestamps/times";

$.ajax({
    url: getTimestampsFullURL,
    type: 'GET',
    success: function(res) {
      var morningCount = res.morning;
      var afternoonCount = res.afternoon;
      var eveningCount = res.evening;
      var nightCount = res.night;

      var timesArray = [morningCount, afternoonCount, eveningCount, nightCount];
      var timeLabelArray = ["Morning", "Afternoon", "Evening", "Night"];

      var ctx = document.getElementById("pieChart").getContext('2d');

        ctx.canvas.width=ctx.canvas.originalwidth;
        ctx.canvas.height=ctx.canvas.originalheight;

        var myChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: timeLabelArray,
                datasets: [{
                    label: 'Number of Seizures',
                    data: timesArray,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
      
    }, 
    async: false
  });

