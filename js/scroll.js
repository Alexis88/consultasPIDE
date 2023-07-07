"use strict";

window.Scroll = {
	flag: true,
	base: 0,

	load: args => {
		if (Scroll.flag){
			Scroll.flag = false;

			Ajax({
				url: args.url,
				data: Ajax.serialize(args.data) + "&base=" + args.base
			}).done(response => {				
				if (Base.sessionClosed(response)) return;
				args.tbody.innerHTML += response;				
				args.callback && {}.toString.call(args.callback) == "[object Function]" && args.callback();
				Tablas.load();
			}).fail(error => {
				Notification.msg(error);
			}).always(_ => setTimeout(_=> Scroll.flag = true, 1000));
		}
	},

	bottom: _ => {
		if (Scroll.flag){
			return window.innerHeight + window.scrollY >= document.documentElement.scrollHeight;
		}
		return false;
	}
};