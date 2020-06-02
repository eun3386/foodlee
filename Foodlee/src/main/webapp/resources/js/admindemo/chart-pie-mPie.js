// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    // labels: ["일반 회원 남성", "일반 회원 여성", "판매자 남성", "판매자 여성"],
	// labels: ["", ""],
	labels: ["남성", "여성"],
    datasets: [{
    	 /* Outer doughnut data starts*/
      // label: ["일반 회원 남성", "일반 회원 여성"],
      data: [mmale, mfemale],
      backgroundColor: ['#2e59d9', 'red'],
      // hoverBackgroundColor: ['#2e59d9', '#red'],
      // hoverBorderColor: "rgba(234, 236, 244, 1)",
      // label: '일반 회원'
    }, {
    	// label: ["판매자 남성", "판매자 여성"],
    	data: [smale, sfemale],
        backgroundColor: ["rgb(0, 255, 0)", "#F9D71C"],
        // label: '판매자 회원'
        }
    ], 
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
