

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



	engine = BPF.ar(engine,rpm.linexp(800,7000,800,4500), 0.3);

	engine = LPF.ar(engine, rpm.linexp(800,7000,200,12000) + 800);

	engine = HPF.ar(engine, rpm.linlin(800,7000,50,400));

	engine = engine * 0.5 ! 2;

}.play;
)


//SUPERCHARGER

(
y = {
	var engineSpeed, rpm, noise, sig, intake, supercharger1, supercharger2;

	engineSpeed = MouseX.kr(800,7000);


	rpm = (engineSpeed/60)*2;

	supercharger1 = Saw.ar(300+rpm*1.4,6);

	supercharger2 = SinOsc.ar(600+rpm*1.4,6);

	//supercharger2 = LPF.ar(supercharger2, );

	sig = supercharger1 + supercharger2;

	sig = sig.tanh;

	sig = (sig * (rpm / 200)).tanh;

	sig = HPF.ar(sig, MouseX.kr(600,1000));

	sig = LPF.ar(sig, rpm * 0.5 + 800);

	sig * 0.3 ! 2;

}.play;
)

{LFNoise2.ar(3000,1)!2*0.2}.play;



//NOTES BELOW


Sigs to note

sig = Saw.ar(rpm, 6) + Blip.ar(rpm*1.4,6); is similar to an i5 engine

sig = Saw.ar(rpm, 6) + Blip.ar(rpm*2.5, 6); AKA sig = Saw.ar(rpm*2.5, 6) + Blip.ar(rpm, 6);

{LPF.ar(Saw.ar(MouseX.kr(0,100),6)!2*0.25)}.play;


//SUBARU SIMILAR



(
y = {
	var engineSpeed, rpm, noise, engine, intake, engine1, engine2, mousePosX, engine3,
	env;

	env = EnvGen.kr(Env.new(
		[800,800,2000,800,8000,800, 800], [0.5, 0.5, 1, 1, 3, 1]
	), doneAction:2);



	engineSpeed = env;

	mousePosX = MouseX.kr(0,1);


	rpm = (engineSpeed/60)*2;

	//engine = Saw.ar(rpm*2.5, 6) + Blip.ar(rpm, 6);

	engine1 = Saw.ar(rpm*2.5,6) + Blip.ar(rpm*3, 6);
	engine2 = Saw.ar(rpm,6);
	engine3 = VarSaw.ar(rpm*0.25) + VarSaw.ar(rpm*0.5);

	engine1 = LPF.ar(engine1, (mousePosX*600)+100);


	engine2 = HPF.ar(engine2, mousePosX * 100);

	engine2 = engine2 * ((mousePosX*0.3)+0.4);



	engine3 * (mousePosX * 1.5);




	engine = engine1 + engine2 + engine3;

	//engine = engine * rpm.linlin(800,7000,1,6);


	//engine = engine.tanh;

	engine = (engine*1.5).softclip;



	engine = BPF.ar(engine, MouseX.kr(800,1200));

	engine = LPF.ar(engine, 1000 + engineSpeed/10);

	engine = HPF.ar(engine, engineSpeed/30);

	engine * 0.1 ! 2;

}.play;
)




Blip


Saw
VarSaw

Pulse

Klang



