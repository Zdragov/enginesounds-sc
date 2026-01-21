

//INTAKE


(
x = {
	var engineSpeed, rpm, noise, sig, intake;

	engineSpeed = MouseX.kr(800,7000);



	rpm = (engineSpeed/60)*2;

	intake = PinkNoise.ar(1);
	intake = HPF.ar(intake, MouseX.kr(50,400));
	intake = BPF.ar(intake, MouseX.kr(400,1500), 0.5);
	intake = HPF.ar(intake, MouseX.kr(800,3200));


	intake.tanh;


	//sig = Saw.ar(rpm) + Pulse.ar((rpm-100)*1.2);

	sig = intake ! 2 * 0.3;

}.play;
)




//ENGINE

{LPF.ar(Saw.ar(MouseX.kr(0,100),6)!2*0.25)}.play;

(
y = {
	var engineSpeed, rpm, noise, engine, intake, engine1, engine2;

	engineSpeed = MouseX.kr(800,7000);


	rpm = (engineSpeed/60)*2;

	engine = Saw.ar(rpm*2.5, 6) + Blip.ar(rpm, 6);

	engine1 = Saw.ar(rpm*2.5,6);
	engine2 = Saw.ar(rpm,6);

	engine1 = LPF.ar(engine1, rpm.linexp(800,7000,300,100));

	engine = engine1 + engine2;

	engine = engine * rpm.linlin(800,7000,1,6);



	engine = engine.tanh;



	engine = BPF.ar(
		engine,
		rpm.linexp(800,7000,800,4500)
		, 0.3);

	engine = LPF.ar(engine, rpm.linexp(800,7000,200,12000) + 800);

	engine = HPF.ar(engine, rpm.linlin(00,7000,50,400));

	engine * 0.5 ! 2;

}.play;
)


//SUPERCHARGER

(
y = {
	var engineSpeed, rpm, noise, sig, intake;

	engineSpeed = MouseX.kr(800,7000);


	rpm = (engineSpeed/60)*2;

	sig = Saw.ar(300+rpm*1.4,6) + Saw.ar(600+rpm*1.4,6);

	sig = sig.tanh;

	sig = (sig * (rpm / 200)).tanh;

	sig = HPF.ar(sig, MouseX.kr(600,1000));

	sig = LPF.ar(sig, rpm * 0.5 + 800);

	sig * 0.3 ! 2;

}.play;
)

y



//NOTES BELOW


Sigs to note

sig = Saw.ar(rpm, 6) + Blip.ar(rpm*1.4,6); is similar to an i5 engine

sig = Saw.ar(rpm, 6) + Blip.ar(rpm*2.5, 6); AKA sig = Saw.ar(rpm*2.5, 6) + Blip.ar(rpm, 6);



//SUBARU SIMILAR

{LPF.ar(Saw.ar(MouseX.kr(0,100),6)!2*0.25)}.play;

(
y = {
	var engineSpeed, rpm, noise, engine, intake, engine1, engine2;

	engineSpeed = MouseX.kr(800,7000);


	rpm = (engineSpeed/60)*2;

	engine = Saw.ar(rpm*2.5, 6) + Blip.ar(rpm, 6);

	engine1 = Saw.ar(rpm*2.5,6);
	engine2 = Saw.ar(rpm,6);

	engine1 = LPF.ar(engine1, rpm.linexp(800,7000,300,100));

	engine = engine1 + engine2;

	engine = engine * rpm.linlin(800,7000,1,6);



	engine = engine.tanh;



	engine = BPF.ar(
		engine,
		rpm.linexp(800,7000,800,4500)
		, 0.3);

	engine = LPF.ar(engine, rpm.linexp(800,7000,200,12000) + 800);

	engine = HPF.ar(engine, rpm.linlin(00,7000,50,400));

	engine * 0.5 ! 2;

}.play;
)




Blip

Saw

Pulse

Klang



