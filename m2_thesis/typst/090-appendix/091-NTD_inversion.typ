at lower $V_b$, increasing bias voltage result in stronger drop in resistance due to heating (electrothermal feedback), thus stabilizing the power,

$ P = I_B^2 R_b $

for steady state after $V_B -> V_B + Delta V$,
$ P(t=t_1) - P(t=t_0) = (I_B + delta I)^2 (R_b + delta R) - I_B^2 R_b $
here $I_B -> I_B + delta I$ and $R_b -> R_b + delta R$ ($delta R < 0$)

$ therefore (Delta P)/P = 2 (delta I)/I_B + (delta R)/R_b + O("2nd order in " delta_s) $

and if the voltage across the NTD, $V_b -> V_b + delta V$,
$ V_b + delta V = (I_B + delta I)(R_b + delta R) quad ; quad V_b = I_B R_b $
$ (delta V)/V = (delta I)/I_B + (delta R)/R_b $

i.e. in the stable region, $delta R$ decreases for the given rise in $Delta V -> delta I$ to compensate this reaching a point $Delta P = 0 -> (delta R)/R_b ~ - abs(2 (delta I)/I_B)$

However, past the inversion point, the temperature is high enough the $(delta R)/R$ cannot compensate
$ (delta R)/R = -gamma (T/T_0)^(-gamma) (d T)/T = -gamma (T_0/T)^gamma (d T)/T $

for the risen current, creating a thermal runaway, where the voltage across the NTD does not increase while the $I_B$ keeps increasing.
