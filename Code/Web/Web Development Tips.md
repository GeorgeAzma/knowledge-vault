- Make pc localhost server work on phone
	- disable public network firewall
	- update vite config to host server to `0.0.0.0:port` or `<pc-ipv4>:port`
	- search `<pc-ipv4>:port` on phone
> [!note] 
> - changing vite config makes vite only listen to `<pc-ipv4>:port`
> -  `0.0.0.0` means same as `<pc-ipv4>` but it listens to all [[Data Link|network interfaces]]
> - `127.0.0.1` is localhost, only current machine can access it
