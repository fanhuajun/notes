var str="3115sd";



//纯数字测试
var pureDigital = "321313"
var pureDigitalRe = pureDigital.match(/^\d+$/);
//console.log(str.match(/^[1-9][0-9]{0,4}$/));
//console.log(str.match(/^[1-9][0-9]{0,4}$/));
console.log(pureDigitalRe);

if (pureDigitalRe){
	console.log(true);
}else{
	console.log(false);
};