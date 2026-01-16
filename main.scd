
(
{
	var engineSpeed, rpm, noise, sig, intake;

	engineSpeed = MouseX.kr(800,7000);



	rpm = (engineSpeed/60)*2;

	intake = PinkNoise.ar(1);
	intake = HPF.ar(intake, MouseX.kr(50,150));
	intake = BPF.ar(intake, MouseX.kr(400,1000), 0.5);
	intake.tanh;


	//sig = Saw.ar(rpm) + Pulse.ar((rpm-100)*1.2);

	sig = intake ! 2 * 0.1;




}.play;
)

Blip

Saw

Pulse

Klang

sig = Saw.ar(rpm, 6) + Blip.ar(rpm*1.4,6); is similar to an i5 engine


(
{
	var engineSpeed, rpm, noise, sig, intake;

	engineSpeed = MouseX.kr(800,7000);



	rpm = (engineSpeed/60)*2;




	sig = Saw.ar(rpm, 6) + Blip.ar(rpm, 6);

	sig = sig.tanh;

	sig = (sig * (rpm / 200)).tanh;

	sig = BPF.ar(sig, engineSpeed/10, 0.3);



	sig = LPF.ar(sig, rpm * 0.5 + 800);

	sig * 0.5 ! 2;

}.play;
)