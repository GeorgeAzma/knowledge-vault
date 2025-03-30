Cross-Origin Resource Sharing 
by default browsers block sites from making requests to different domain
CORS enables servers to allow specific domains to access their resources
> [!example] Without CORS
> - user goes to `malicious-site.com`
> - site runs script that sends request to `bank.com/api/transfer-to-hacker`
> - user's bank session is active, since user was logged in previously
> - so malicious script succeeds
