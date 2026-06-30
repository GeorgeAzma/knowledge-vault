### Components
- [[Regression|Autoregressive]] influence of past points of data on current point
- **Integrated** remove graph trends by subtracting previous point to current `derivative`
- [[Moving Average]] averaged points over few frames
### Parameters $ARIMA(p,q,d)$
- $p$ [[Regression|Autoregressive]] order, number of past observations considered for making predictions
- $q$ [[Moving Average]] order, how many previous observations are averaged when making predictions
- $d$ Integration order, number of differences needed to make time series stationary `nth order derivative`

> [!example]
> - $ARIMA(1,0,0)$: Data is dependent on itself `also called AR(1)`
> - $ARIMA(1,0,1)$: Data does not follow a trend, but it's moving average is dependent on itself
