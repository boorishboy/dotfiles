"use strict";var I=Object.defineProperty;var H=Object.getOwnPropertyDescriptor;var v=Object.getOwnPropertyNames;var A=Object.prototype.hasOwnProperty;var k=(t,e)=>{for(var n in e)I(t,n,{get:e[n],enumerable:!0})},_=(t,e,n,a)=>{if(e&&typeof e=="object"||typeof e=="function")for(let r of v(e))!A.call(t,r)&&r!==n&&I(t,r,{get:()=>e[r],enumerable:!(a=H(e,r))||a.enumerable});return t};var j=t=>_(I({},"__esModule",{value:!0}),t);var G={};k(G,{default:()=>F});module.exports=j(G);var u=require("@raycast/api"),b=require("react");var y=require("@raycast/api"),P=require("react");var d=t=>{let e=Math.floor(t/3600),n=String(Math.floor(t%3600/60)).padStart(2,"0"),a=String(Math.floor(t%60)).padStart(2,"0");return`${e===0?"":e+":"}${n}:${a}`};var h=t=>(t.d1=t.d1=="----"?void 0:t.d1,t.d2=t.d2=="----"?void 0:t.d2,Math.round((t.d1?new Date(t.d1):new Date).getTime()-(t.d2?new Date(t.d2):new Date).getTime())/1e3);var f=require("@raycast/api"),W=require("child_process"),O=require("crypto"),o=require("fs"),B=require("path");var i=require("@raycast/api");var M=(t,e)=>(t==null||t.length==0||t.length==null)&&!["always","onlyWhenNotRunning"].includes(e.showMenuBarIconWhen),E=t=>{let e=(0,i.getPreferenceValues)();if(t.launchedFromMenuBar||e.closeWindowOnTimerStart){let n=t.isErr?"\u26A0\uFE0F":"\u{1F389}";return(0,i.showHUD)(`${n} ${t.msg}`),(0,i.popToRoot)()}else(0,i.showToast)({style:t.isErr?i.Toast.Style.Failure:i.Toast.Style.Success,title:t.msg})};var p=f.environment.supportPath+"/raycast-stopwatches.json",l=()=>{(!(0,o.existsSync)(p)||(0,o.readFileSync)(p).toString()=="")&&(0,o.writeFileSync)(p,"[]")},N=t=>({name:t,swID:(0,O.randomUUID)(),timeStarted:new Date,timeElapsed:-99,lastPaused:"----",pauseElapsed:0}),V=t=>(t.map(e=>{if(e.lastPaused!="----")e.timeElapsed=Math.max(0,h({d1:e.lastPaused,d2:e.timeStarted})-e.pauseElapsed);else{let n=Math.max(0,h({d2:e.timeStarted}));e.timeElapsed=n-e.pauseElapsed}}),t),C=()=>{l();let t=JSON.parse((0,o.readFileSync)(p).toString()),e=Y(t),n=V(e);return n.sort((a,r)=>a.timeElapsed-r.timeElapsed),n},$=async({swName:t="Untitled",launchedFromMenuBar:e=!1})=>{l();let n=JSON.parse((0,o.readFileSync)(p).toString()),a=N(t);n.push(a),(0,o.writeFileSync)(p,JSON.stringify(n)),E({msg:`Stopwatch "${t}" started!`,launchedFromMenuBar:e,isErr:!1})},J=t=>{l();let e=JSON.parse((0,o.readFileSync)(p).toString());e=e.map(n=>n.swID==t?{...n,lastPaused:new Date}:n),(0,o.writeFileSync)(p,JSON.stringify(e))},L=t=>{l();let e=JSON.parse((0,o.readFileSync)(p).toString());e=e.map(n=>n.swID==t?{...n,pauseElapsed:n.pauseElapsed+h({d2:n.lastPaused}),lastPaused:"----"}:n),(0,o.writeFileSync)(p,JSON.stringify(e))},R=t=>{l();let e=JSON.parse((0,o.readFileSync)(p).toString());e=e.filter(n=>n.swID!==t),(0,o.writeFileSync)(p,JSON.stringify(e))},Y=t=>((0,o.readdirSync)(f.environment.supportPath).forEach(n=>{if((0,B.extname)(n)==".stopwatch"){let a=N((0,o.readFileSync)(f.environment.supportPath+"/"+n).toString()),r=n.replace(/__/g,":").replace(".stopwatch","");a.timeStarted=new Date(r),a.timeElapsed=Math.max(0,h({})),(0,W.execSync)(`rm "${f.environment.supportPath}/${n}"`),t.push(a)}}),(0,o.writeFileSync)(p,JSON.stringify(t)),t);function D(){let[t,e]=(0,P.useState)(void 0),[n,a]=(0,P.useState)(t===void 0),r=()=>{let c=C();e(c),a(!1)},w=c=>{$(c),r()},T=c=>{J(c),r()},S=c=>{L(c),r()},g=c=>{(0,y.getPreferenceValues)().copyOnSwStop&&y.Clipboard.copy(d(c.timeElapsed)),R(c.swID),r()};return{stopwatches:t,isLoading:n,refreshSWes:r,handleRestartSW:c=>{g(c),w({swName:c.name,launchedFromMenuBar:!1}),r()},handleStartSW:w,handleStopSW:g,handlePauseSW:T,handleUnpauseSW:S}}var x=(t,e)=>{if(t===void 0||t?.length===0||t.length==null)return;let n="timeLeft"in t[0]?t[0].timeLeft:t[0].timeElapsed;return e.showTitleInMenuBar?`${t[0].name}: ~${d(n)}`:`~${d(n)}`},U=(t,e,n)=>{switch(e.showMenuBarIconWhen){case"always":return n;case"never":return;case"onlyWhenRunning":return t!==void 0&&t?.length>0?n:void 0;case"onlyWhenNotRunning":return t===void 0||t?.length===0?n:void 0}};var m=require("react/jsx-runtime");function F(){let{stopwatches:t,isLoading:e,refreshSWes:n,handlePauseSW:a,handleStartSW:r,handleStopSW:w,handleUnpauseSW:T}=D();(0,b.useEffect)(()=>{n(),setInterval(()=>{n()},1e3)},[]),e&&n();let S=(0,u.getPreferenceValues)();if(M(t,S))return null;let g=s=>s.lastPaused==="----"?" elapsed":" (paused)";return(0,m.jsxs)(u.MenuBarExtra,{icon:U(t,S,u.Icon.Stopwatch),isLoading:e,title:x(t,S),children:[(0,m.jsx)(u.MenuBarExtra.Item,{title:"Click running stopwatch to pause"}),t?.map(s=>(0,m.jsx)(u.MenuBarExtra.Item,{title:s.name+": "+d(s.timeElapsed)+g(s),onAction:()=>s.lastPaused==="----"?a(s.swID):T(s.swID)},s.swID)),(0,m.jsx)(u.MenuBarExtra.Section,{children:t?.map(s=>(0,m.jsx)(u.MenuBarExtra.Item,{title:`Delete "${s.name}"`,onAction:()=>w(s)},s.swID))}),(0,m.jsx)(u.MenuBarExtra.Section,{children:(0,m.jsx)(u.MenuBarExtra.Item,{title:"Start New Stopwatch",onAction:()=>r({launchedFromMenuBar:!0})},"startSW")})]})}