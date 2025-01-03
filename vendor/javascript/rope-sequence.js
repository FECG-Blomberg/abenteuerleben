// rope-sequence@1.3.4 downloaded from https://ga.jspm.io/npm:rope-sequence@1.3.4/dist/index.js

var e=200;var t=function RopeSequence(){};t.prototype.append=function append(n){if(!n.length)return this;n=t.from(n);return!this.length&&n||n.length<e&&this.leafAppend(n)||this.length<e&&n.leafPrepend(this)||this.appendInner(n)};t.prototype.prepend=function prepend(e){return e.length?t.from(e).append(this):this};t.prototype.appendInner=function appendInner(e){return new r(this,e)};t.prototype.slice=function slice(e,n){void 0===e&&(e=0);void 0===n&&(n=this.length);return e>=n?t.empty:this.sliceInner(Math.max(0,e),Math.min(this.length,n))};t.prototype.get=function get(e){if(!(e<0||e>=this.length))return this.getInner(e)};t.prototype.forEach=function forEach(e,t,n){void 0===t&&(t=0);void 0===n&&(n=this.length);t<=n?this.forEachInner(e,t,n,0):this.forEachInvertedInner(e,t,n,0)};t.prototype.map=function map(e,t,n){void 0===t&&(t=0);void 0===n&&(n=this.length);var r=[];this.forEach((function(t,n){return r.push(e(t,n))}),t,n);return r};t.from=function from(e){return e instanceof t?e:e&&e.length?new n(e):t.empty};var n=function(t){function Leaf(e){t.call(this);this.values=e}t&&(Leaf.__proto__=t);Leaf.prototype=Object.create(t&&t.prototype);Leaf.prototype.constructor=Leaf;var n={length:{configurable:true},depth:{configurable:true}};Leaf.prototype.flatten=function flatten(){return this.values};Leaf.prototype.sliceInner=function sliceInner(e,t){return 0==e&&t==this.length?this:new Leaf(this.values.slice(e,t))};Leaf.prototype.getInner=function getInner(e){return this.values[e]};Leaf.prototype.forEachInner=function forEachInner(e,t,n,r){for(var p=t;p<n;p++)if(false===e(this.values[p],r+p))return false};Leaf.prototype.forEachInvertedInner=function forEachInvertedInner(e,t,n,r){for(var p=t-1;p>=n;p--)if(false===e(this.values[p],r+p))return false};Leaf.prototype.leafAppend=function leafAppend(t){if(this.length+t.length<=e)return new Leaf(this.values.concat(t.flatten()))};Leaf.prototype.leafPrepend=function leafPrepend(t){if(this.length+t.length<=e)return new Leaf(t.flatten().concat(this.values))};n.length.get=function(){return this.values.length};n.depth.get=function(){return 0};Object.defineProperties(Leaf.prototype,n);return Leaf}(t);t.empty=new n([]);var r=function(e){function Append(t,n){e.call(this);this.left=t;this.right=n;this.length=t.length+n.length;this.depth=Math.max(t.depth,n.depth)+1}e&&(Append.__proto__=e);Append.prototype=Object.create(e&&e.prototype);Append.prototype.constructor=Append;Append.prototype.flatten=function flatten(){return this.left.flatten().concat(this.right.flatten())};Append.prototype.getInner=function getInner(e){return e<this.left.length?this.left.get(e):this.right.get(e-this.left.length)};Append.prototype.forEachInner=function forEachInner(e,t,n,r){var p=this.left.length;return!(t<p&&false===this.left.forEachInner(e,t,Math.min(n,p),r))&&(!(n>p&&false===this.right.forEachInner(e,Math.max(t-p,0),Math.min(this.length,n)-p,r+p))&&void 0)};Append.prototype.forEachInvertedInner=function forEachInvertedInner(e,t,n,r){var p=this.left.length;return!(t>p&&false===this.right.forEachInvertedInner(e,t-p,Math.max(n,p)-p,r+p))&&(!(n<p&&false===this.left.forEachInvertedInner(e,Math.min(t,p),n,r))&&void 0)};Append.prototype.sliceInner=function sliceInner(e,t){if(0==e&&t==this.length)return this;var n=this.left.length;return t<=n?this.left.slice(e,t):e>=n?this.right.slice(e-n,t-n):this.left.slice(e,n).append(this.right.slice(0,t-n))};Append.prototype.leafAppend=function leafAppend(e){var t=this.right.leafAppend(e);if(t)return new Append(this.left,t)};Append.prototype.leafPrepend=function leafPrepend(e){var t=this.left.leafPrepend(e);if(t)return new Append(t,this.right)};Append.prototype.appendInner=function appendInner(e){return this.left.depth>=Math.max(this.right.depth,e.depth)+1?new Append(this.left,new Append(this.right,e)):new Append(this,e)};return Append}(t);export{t as default};

