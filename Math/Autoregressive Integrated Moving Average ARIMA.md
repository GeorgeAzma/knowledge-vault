### Components
- [[Regression|Autoregressive]]: Today's temperature is likely influenced by past few days temperatures, this is called
- **Integrated**: Temperatures over a season are generally rising/decreasing, to remove this trand you subtract yesterdays temperature from todays temperature, this gives you temperature changes and is called Integration
- [[Moving Average]]: Averaged temperature over some time frame
### Parameters $ARIMA(p,q,d)$
- $p$: [[Regression|Autoregressive]] order, number of past observations considered for making predictions
- $q$: [[Moving Average]] order, how many previous observations are averaged when making predictions
- $d$: Integration order, number of differences needed to make the time series stationary `e.g it's like a x order derivative`

> [!example]
> - $ARIMA(1,0,0)$: Data is dependent on itself `also called AR(1)`
> - $ARIMA(1,0,1)$: Data does not follow a trend, but it's moving average is dependent on itself
