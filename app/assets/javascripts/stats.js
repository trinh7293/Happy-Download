/* eslint-disable no-undef */
$(document).on('turbolinks:load', function() {
  if ($('#chart-happy').length > 0) {
    var pointInterval = $('#chart-happy').data('pointInterval');
    var pointStart = $('#chart-happy').data('pointStart');
    var datasale = $('#chart-happy').data('datasale');
    var datapurcharse = $('#chart-happy').data('datapurcharse');

    Highcharts.chart('chart-happy', {
      title: {
        text: I18n.t('userstats')
      },

      subtitle: {
        text: I18n.t('happy_download')
      },

      yAxis: {
        title: {
          text: I18n.t('your_items')
        }
      },
      legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
      },

      tooltip: {
        formatter: function () {
          return Highcharts.dateFormat('%B %e, %Y, this.x') + ':$' +
            Highcharts.numberFormat(this.y, 2);
        }
      },

      series: [
        {
          name: I18n.t('your_sales'),
          pointInterval: pointInterval,
          pointStart: pointStart,
          data: datasale
        }, {
          name: I18n.t('your_purchases'),
          pointInterval: pointInterval,
          pointStart: pointStart,
          data: datapurcharse
        }
      ]
    });
  }
});
