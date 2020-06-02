// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

var today = new Date();
var month = today.getMonth() + 1;
var monthArray = new Array(month);

for (var i = 0; i < monthArray.length; i++) {
	monthArray[i] = (i + 1) + "월";
}

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var ctx2 = document.getElementById("myAreaChart2");

var myLineChart = new Chart(ctx, {
  
  type: 'line',
  data: {
    // labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	// labels: ["1월", "2월", "3월", "4월", "5월", "6월"],
	labels: monthArray,
    datasets: [{
    	  label: "주문건수",
    	  yAxisID: 'order',
          lineTension: 0.3,
          backgroundColor: "rgba(78, 115, 223, 0.05)",
          borderColor: "rgba(78, 115, 223, 1)",
          pointRadius: 3,
          pointBackgroundColor: "rgba(78, 115, 223, 1)",
          pointBorderColor: "rgba(78, 115, 223, 1)",
          pointHoverRadius: 3,
          pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
          pointHoverBorderColor: "rgba(78, 115, 223, 1)",
          pointHitRadius: 10,
          pointBorderWidth: 2,
          // data: [0, 100, 200, 300, 400, 500],
          data: mOrderNum,
	}, {
		  label: "총합가격",
		  yAxisID: 'price',
	      lineTension: 0.3,
	      backgroundColor: "rgba(225, 18, 18, 0.05)",
	      borderColor: "rgba(225, 18, 18, 1)",
	      pointRadius: 3,
	      pointBackgroundColor: "rgba(225, 18, 18, 1)",
	      pointBorderColor: "rgba(225, 18, 18, 1)",
	      pointHoverRadius: 3,
	      pointHoverBackgroundColor: "rgba(225, 18, 18, 1)",
	      pointHoverBorderColor: "rgba(225, 18, 18, 1)",
	      pointHitRadius: 10,
	      pointBorderWidth: 2,
	      // data: [50000, 200000, 600000, 120000, 180000, 250000],
	      data: mOrderPriceSum,
	      
	}]
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 12
        }
      }],
      yAxes: [{
          id: 'order',
          type: 'linear',
          position: 'left',
          ticks: {
              maxTicksLimit: 5,
              padding: 10,
              // Include a dollar sign in the ticks
              callback: function(value, index, values) {
                return number_format(value);
              }
            },
            gridLines: {
              color: "rgb(234, 236, 244)",
              zeroLineColor: "rgb(234, 236, 244)",
              drawBorder: false,
              borderDash: [2],
              zeroLineBorderDash: [2]
            }, 
        }, {
          id: 'price',
          type: 'linear',
          position: 'right',
          ticks: {
              maxTicksLimit: 5,
              padding: 10,
              // Include a dollar sign in the ticks
              callback: function(value, index, values) {
                return number_format(value);
              }
            },
            gridLines: {
              color: "rgb(234, 236, 244)",
              zeroLineColor: "rgb(234, 236, 244)",
              drawBorder: false,
              borderDash: [2],
              zeroLineBorderDash: [2]
            },
        }]
    },
    legend: {
      display: true
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
        }
      }
    }
  }
});


var myLineChart2 = new Chart(ctx2, {
	  
	  type: 'line',
	  data: {
	    // labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		// labels: ["1월", "2월", "3월", "4월", "5월", "6월"],
		labels: monthArray,
	    datasets: [{
	    	  label: "주문건수",
	    	  yAxisID: 'order',
	          lineTension: 0.3,
	          backgroundColor: "rgba(78, 115, 223, 0.05)",
	          borderColor: "rgba(78, 115, 223, 1)",
	          pointRadius: 3,
	          pointBackgroundColor: "rgba(78, 115, 223, 1)",
	          pointBorderColor: "rgba(78, 115, 223, 1)",
	          pointHoverRadius: 3,
	          pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
	          pointHoverBorderColor: "rgba(78, 115, 223, 1)",
	          pointHitRadius: 10,
	          pointBorderWidth: 2,
	          // data: [0, 100, 200, 300, 400, 500],
	          data: mOrderNum,
		}, {
			  label: "총합가격",
			  yAxisID: 'price',
		      lineTension: 0.3,
		      backgroundColor: "rgba(225, 18, 18, 0.05)",
		      borderColor: "rgba(225, 18, 18, 1)",
		      pointRadius: 3,
		      pointBackgroundColor: "rgba(225, 18, 18, 1)",
		      pointBorderColor: "rgba(225, 18, 18, 1)",
		      pointHoverRadius: 3,
		      pointHoverBackgroundColor: "rgba(225, 18, 18, 1)",
		      pointHoverBorderColor: "rgba(225, 18, 18, 1)",
		      pointHitRadius: 10,
		      pointBorderWidth: 2,
		      // data: [50000, 200000, 600000, 120000, 180000, 250000],
		      data: mOrderPriceSum,
		      
		}]
	  },
	  options: {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	    },
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'date'
	        },
	        gridLines: {
	          display: false,
	          drawBorder: false
	        },
	        ticks: {
	          maxTicksLimit: 12
	        }
	      }],
	      yAxes: [{
	          id: 'order',
	          type: 'linear',
	          position: 'left',
	          ticks: {
	              maxTicksLimit: 5,
	              padding: 10,
	              // Include a dollar sign in the ticks
	              callback: function(value, index, values) {
	                return number_format(value);
	              }
	            },
	            gridLines: {
	              color: "rgb(234, 236, 244)",
	              zeroLineColor: "rgb(234, 236, 244)",
	              drawBorder: false,
	              borderDash: [2],
	              zeroLineBorderDash: [2]
	            }, 
	        }, {
	          id: 'price',
	          type: 'linear',
	          position: 'right',
	          ticks: {
	              maxTicksLimit: 5,
	              padding: 10,
	              // Include a dollar sign in the ticks
	              callback: function(value, index, values) {
	                return number_format(value);
	              }
	            },
	            gridLines: {
	              color: "rgb(234, 236, 244)",
	              zeroLineColor: "rgb(234, 236, 244)",
	              drawBorder: false,
	              borderDash: [2],
	              zeroLineBorderDash: [2]
	            },
	        }]
	    },
	    legend: {
	      display: true
	    },
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      intersect: false,
	      mode: 'index',
	      caretPadding: 10,
	      callbacks: {
	        label: function(tooltipItem, chart) {
	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	          return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
	        }
	      }
	    }
	  }
	});

