
(
{
	var engineSpeed, rpm, noise, sig;

	engineSpeed = MouseX.kr(800,7000);

	rpm = (engineSpeed/60)*2;




	//sig = Saw.ar(rpm) + Pulse.ar((rpm-100)*1.2);

	sig = Blip.ar(rpm, 6);

	sig = sig.tanh;

	sig = BPF.ar(sig, 300, 0.3);



	sig = LPF.ar(sig, rpm * 0.5 + 800);

	sig * 1 ! 2;


}.play;
)

Blip

Saw

Pulse

Klang