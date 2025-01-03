// prosemirror-inputrules@1.4.0 downloaded from https://ga.jspm.io/npm:prosemirror-inputrules@1.4.0/dist/index.js

import{Plugin as e}from"prosemirror-state";import{findWrapping as t,canJoin as n}from"prosemirror-transform";class InputRule{constructor(e,t,n={}){this.match=e;this.match=e;this.handler=typeof t=="string"?stringHandler(t):t;this.undoable=n.undoable!==false;this.inCode=n.inCode||false}}function stringHandler(e){return function(t,n,l,r){let o=e;if(n[1]){let e=n[0].lastIndexOf(n[1]);o+=n[0].slice(e+n[1].length);l+=e;let t=l-r;if(t>0){o=n[0].slice(e-t,e)+o;l=r}}return t.tr.insertText(o,l,r)}}const l=500;function inputRules({rules:t}){let n=new e({state:{init(){return null},apply(e,t){let n=e.getMeta(this);return n||(e.selectionSet||e.docChanged?null:t)}},props:{handleTextInput(e,l,r,o){return run(e,l,r,o,t,n)},handleDOMEvents:{compositionend:e=>{setTimeout((()=>{let{$cursor:l}=e.state.selection;l&&run(e,l.pos,l.pos,"",t,n)}))}}},isInputRules:true});return n}function run(e,t,n,r,o,u){if(e.composing)return false;let s=e.state,i=s.doc.resolve(t);let p=i.parent.textBetween(Math.max(0,i.parentOffset-l),i.parentOffset,null,"￼")+r;for(let l=0;l<o.length;l++){let c=o[l];if(i.parent.type.spec.code){if(!c.inCode)continue}else if(c.inCode==="only")continue;let a=c.match.exec(p);let f=a&&c.handler(s,a,t-(a[0].length-r.length),n);if(f){c.undoable&&f.setMeta(u,{transform:f,from:t,to:n,text:r});e.dispatch(f);return true}}return false}const undoInputRule=(e,t)=>{let n=e.plugins;for(let l=0;l<n.length;l++){let r,o=n[l];if(o.spec.isInputRules&&(r=o.getState(e))){if(t){let n=e.tr,l=r.transform;for(let e=l.steps.length-1;e>=0;e--)n.step(l.steps[e].invert(l.docs[e]));if(r.text){let t=n.doc.resolve(r.from).marks();n.replaceWith(r.from,r.to,e.schema.text(r.text,t))}else n.delete(r.from,r.to);t(n)}return true}}return false};const r=new InputRule(/--$/,"—");const o=new InputRule(/\.\.\.$/,"…");const u=new InputRule(/(?:^|[\s\{\[\(\<'"\u2018\u201C])(")$/,"“");const s=new InputRule(/"$/,"”");const i=new InputRule(/(?:^|[\s\{\[\(\<'"\u2018\u201C])(')$/,"‘");const p=new InputRule(/'$/,"’");const c=[u,s,i,p];function wrappingInputRule(e,l,r=null,o){return new InputRule(e,((e,u,s,i)=>{let p=r instanceof Function?r(u):r;let c=e.tr.delete(s,i);let a=c.doc.resolve(s),f=a.blockRange(),d=f&&t(f,l,p);if(!d)return null;c.wrap(f,d);let h=c.doc.resolve(s-1).nodeBefore;h&&h.type==l&&n(c.doc,s-1)&&(!o||o(u,h))&&c.join(s-1);return c}))}function textblockTypeInputRule(e,t,n=null){return new InputRule(e,((e,l,r,o)=>{let u=e.doc.resolve(r);let s=n instanceof Function?n(l):n;return u.node(-1).canReplaceWith(u.index(-1),u.indexAfter(-1),t)?e.tr.delete(r,o).setBlockType(r,r,t,s):null}))}export{InputRule,s as closeDoubleQuote,p as closeSingleQuote,o as ellipsis,r as emDash,inputRules,u as openDoubleQuote,i as openSingleQuote,c as smartQuotes,textblockTypeInputRule,undoInputRule,wrappingInputRule};

