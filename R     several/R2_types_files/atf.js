(function(){
var h=false,i=null,k=true;var l="pagead2.googlesyndication.com",m=l;document.URL.indexOf("?google_debug")>0||document.URL.indexOf("&google_debug")>0;function aa(a,b){if(a.attachEvent){a.attachEvent("onload",b);return k}if(a.addEventListener){a.addEventListener("load",b,h);return k}return h}function ba(a,b){a.google_image_requests||(a.google_image_requests=[]);var c=new Image;c.src=b;a.google_image_requests.push(c)}function n(a,b,c){b&&c&&a.push("&",b,"=",typeof encodeURIComponent=="function"?encodeURIComponent(c):escape(c))};var o=this;Math.floor(Math.random()*2147483648).toString(36);var ca=function(a,b){var c=a.p;if(arguments.length>2){var e=Array.prototype.slice.call(arguments,2);c&&e.unshift.apply(e,c);c=e}b=a.r||b;a=a.q||a;var d,f=b||o;d=c?function(){var j=Array.prototype.slice.call(arguments);j.unshift.apply(j,c);return a.apply(f,j)}:function(){return a.apply(f,arguments)};d.p=c;d.r=b;d.q=a;return d},da=Date.now||function(){return(new Date).getTime()};var p=function(a,b){this.x=typeof a!="undefined"?a:0;this.y=typeof b!="undefined"?b:0};p.prototype.toString=function(){return"("+this.x+", "+this.y+")"};var q=function(a,b){this.width=a;this.height=b};q.prototype.toString=function(){return"("+this.width+" x "+this.height+")"};q.prototype.floor=function(){this.width=Math.floor(this.width);this.height=Math.floor(this.height);return this};q.prototype.round=function(){this.width=Math.round(this.width);this.height=Math.round(this.height);return this};var r=function(a){return a.replace(/^[\s\xa0]+|[\s\xa0]+$/g,"")};
var v=function(a,b){for(var c=0,e=r(String(a)).split("."),d=r(String(b)).split("."),f=Math.max(e.length,d.length),j=0;c==0&&j<f;j++){var x=e[j]||"",y=d[j]||"",g=new RegExp("(\\d*)(\\D*)","g"),ea=new RegExp("(\\d*)(\\D*)","g");do{var s=g.exec(x)||["","",""],t=ea.exec(y)||["","",""];if(s[0].length==0&&t[0].length==0)break;var fa=s[1].length==0?0:parseInt(s[1],10),ga=t[1].length==0?0:parseInt(t[1],10);c=u(fa,ga)||u(s[2].length==0,t[2].length==0)||u(s[2],t[2])}while(c==0)}return c},u=function(a,b){if(a<
b)return-1;else if(a>b)return 1;return 0};da();var w,z,A,B,C,D,ha,ia,ja,E=function(){return o.navigator?o.navigator.userAgent:i};var ka=function(){D=C=B=A=z=w=h;var a;if(a=E()){var b=o.navigator;w=a.indexOf("Opera")==0;z=!w&&a.indexOf("MSIE")!=-1;B=(A=!w&&a.indexOf("WebKit")!=-1)&&a.indexOf("Mobile")!=-1;D=(C=!w&&!A&&b.product=="Gecko")&&b.vendor=="Camino"}};ka();var F=w,G=z,H=C,I=A,la=B,ma=function(){var a=o.navigator;return a&&a.platform||""},J=ma(),na=function(){ha=J.indexOf("Mac")!=-1;ia=J.indexOf("Win")!=-1;ja=J.indexOf("Linux")!=-1};na();
var oa=function(){var a="",b;if(F&&o.opera){var c=o.opera.version;a=typeof c=="function"?c():c}else{if(H)b=/rv\:([^\);]+)(\)|;)/;else if(G)b=/MSIE\s+([^\);]+)(\)|;)/;else if(I)b=/WebKit\/(\S+)/;if(b){var e=b.exec(E());a=e?e[1]:""}}return a},K=oa();var L={},M=function(a){return L[a]||(L[a]=v(K,a)>=0)};var N;var Q=function(a){return a?new O(P(a)):N||(N=new O)};var pa=function(a){var b=a.document;if(I&&!M("500")&&!la){if(typeof a.innerHeight=="undefined")a=window;var c=a.innerHeight,e=a.document.documentElement.scrollHeight;if(a==a.top)if(e<c)c-=15;return new q(a.innerWidth,c)}var d=b.compatMode=="CSS1Compat"&&(!F||F&&M("9.50"))?b.documentElement:b.body;return new q(d.clientWidth,d.clientHeight)},qa=function(a){var b=!I&&a.compatMode=="CSS1Compat"?a.documentElement:a.body;return new p(b.scrollLeft,b.scrollTop)};
var ra=function(a,b){a.appendChild(b)},sa=I&&v(K,"521")<=0,ta=function(a,b){if(typeof a.contains!="undefined"&&!sa&&b.nodeType==1)return a==b||a.contains(b);if(typeof a.compareDocumentPosition!="undefined")return a==b||Boolean(a.compareDocumentPosition(b)&16);for(;b&&a!=b;)b=b.parentNode;return b==a},P=function(a){return a.nodeType==9?a:a.ownerDocument||a.document},O=function(a){this.h=a||o.document||document};O.prototype.l=function(){return this.h.compatMode=="CSS1Compat"};O.prototype.j=function(){return qa(this.h)};
O.prototype.appendChild=ra;O.prototype.contains=ta;var R,S,T,U,V,W,ua=function(){W=V=U=T=S=R=h;var a=E();if(a)if(a.indexOf("Firefox")!=-1)R=k;else if(a.indexOf("Camino")!=-1)S=k;else if(a.indexOf("iPhone")!=-1||a.indexOf("iPod")!=-1)T=k;else if(a.indexOf("Android")!=-1)U=k;else if(a.indexOf("Chrome")!=-1)V=k;else if(a.indexOf("Safari")!=-1)W=k};ua();var va=function(a,b){var c=P(a);if(c.defaultView&&c.defaultView.getComputedStyle){var e=c.defaultView.getComputedStyle(a,"");if(e)return e[b]}return i};var X=function(a,b){return va(a,b)||(a.currentStyle?a.currentStyle[b]:i)||a.style[b]};
var wa=function(a){var b;b=a?a.nodeType==9?a:P(a):document;if(G&&!Q(b).l())return b.body;return b.documentElement},xa=function(a){var b=a.getBoundingClientRect();if(G){var c=a.ownerDocument;b.left-=c.documentElement.clientLeft+c.body.clientLeft;b.top-=c.documentElement.clientTop+c.body.clientTop}return b},ya=function(a){if(G)return a.offsetParent;for(var b=P(a),c=X(a,"position"),e=c=="fixed"||c=="absolute",d=a.parentNode;d&&d!=b;d=d.parentNode){c=X(d,"position");e=e&&c=="static"&&d!=b.documentElement&&
d!=b.body;if(!e&&(d.scrollWidth>d.clientWidth||d.scrollHeight>d.clientHeight||c=="fixed"||c=="absolute"))return d}return i},za=function(a){var b,c=P(a),e=X(a,"position"),d=H&&c.getBoxObjectFor&&!a.getBoundingClientRect&&e=="absolute"&&(b=c.getBoxObjectFor(a))&&(b.screenX<0||b.screenY<0),f=new p(0,0),j=wa(c);if(a==j)return f;if(a.getBoundingClientRect){b=xa(a);var x=Q(c).j();f.x=b.left+x.x;f.y=b.top+x.y}else if(c.getBoxObjectFor&&!d){b=c.getBoxObjectFor(a);var y=c.getBoxObjectFor(j);f.x=b.screenX-
y.screenX;f.y=b.screenY-y.screenY}else{var g=a;do{f.x+=g.offsetLeft;f.y+=g.offsetTop;if(g!=a){f.x+=g.clientLeft||0;f.y+=g.clientTop||0}if(I&&X(g,"position")=="fixed"){f.x+=c.body.scrollLeft;f.y+=c.body.scrollTop;break}g=g.offsetParent}while(g&&g!=a);if(F||I&&e=="absolute")f.y-=c.body.offsetTop;for(g=a;(g=ya(g))&&g!=c.body;){f.x-=g.scrollLeft;if(!F||g.tagName!="TR")f.y-=g.scrollTop}}return f};H&&M("1.9");var Y,Z=function(a){this.b=a;this.a=this.d="";if(!a.src||a.nodeName!="IFRAME")this.b=i};Z.prototype.i=function(){if(this.d)return this.d;if(!this.b||!this.b.src)return i;try{var a=za(this.b);if(!a)return i}catch(b){return i}return this.f(a,this.b.src)};Z.prototype.f=function(a,b){var c=[];c.push("x=",Math.round(a.x));c.push("&y=",Math.round(a.y));var e=/[&\?](?:slotname|dt|format)=[^&]+/g,d=this.e(b,e,2);if(!d)return i;c.push(d);return this.d=c.join("")};
Z.prototype.k=function(){if(this.a)return this.a;if(!this.b)return i;var a=/[&\?](?:client|correlator|url)=[^&]+/g,b=this.e(this.b.src,a,3);if(!b)return i;return this.a=b};Z.prototype.e=function(a,b,c){var e=a.match(b);if(!e||e.length<c)return i;var d=e.join("");return d.charAt(0)=="?"?"&"+d.substr(1):d};var $=function(){this.c=[];this.a=""},Aa=function(){Y||(Y=new $);return Y};
$.prototype.enable=function(a){if(a!="html")return h;if(window.google_atf_registered)return k;window.google_atf_registered=k;return aa(window,ca(this.m,this))};$.prototype.m=function(){this.g();this.o()};$.prototype.g=function(){var a=document.getElementsByName("google_ads_frame");if(!a)return h;var b=a.length;if(b<=0)return h;for(var c=0;c<b;++c){var e=new Z(a[c]);if(!this.a){var d=e.k();if(d)this.a=d}this.c.push(e)}return k};
$.prototype.n=function(){if(!this.c||!this.a)return"";var a=this.c.length;if(a<=0)return"";var b=["http://"+m+"/pagead/gen_204?id=atf"];b.push(this.a);var c=pa(window);if(c&&c.width&&c.height){n(b,"biw",c.width.toString());n(b,"bih",c.height.toString())}n(b,"num_ads",a.toString());for(var e=0;e<a;++e)n(b,"ad"+e,this.c[e].i());var d=window==window.top?"0":"1";n(b,"embed",d);return b.join("")};$.prototype.o=function(){var a=this.n();a&&ba(window,a)};
function Ba(){var a=window.google_ad_output||"html";Aa().enable(a)}Ba();
})()