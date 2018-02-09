within EU_CleanSky.EDS.SafetyLib.Internal;
model TwoToOneOr
  "Each boolean output is true if at least one of the other inputs is true"
  extends TwoToOne;
  Modelica.Blocks.Logical.Or or1
    annotation (Placement(transformation(extent={{32,-32},{48,-48}})));
  Modelica.Blocks.Logical.Or or2
    annotation (Placement(transformation(extent={{32,32},{48,48}})));
  Modelica.Blocks.Logical.Or or3
    annotation (Placement(transformation(extent={{-32,-8},{-48,8}})));
  Modelica.Blocks.Logical.Pre pre1 annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={0,14})));
  Modelica.Blocks.Logical.Pre pre2 annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={-4,-30})));
equation
  connect(or3.y, f.FtoM)  annotation (Line(
      points={{-48.8,0},{-100,0}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or2.y, m2.MtoF)  annotation (Line(
      points={{48.8,40},{100,40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or1.y, m1.MtoF)  annotation (Line(
      points={{48.8,-40},{100,-40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or2.u1, f.MtoF)  annotation (Line(
      points={{30.4,40},{-60,40},{-60,0},{-100,0}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or1.u1, f.MtoF)  annotation (Line(
      points={{30.4,-40},{-60,-40},{-60,0},{-100,0}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or3.u1, m2.FtoM)  annotation (Line(
      points={{-30.4,0},{60,0},{60,40},{100,40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or3.u2, m1.FtoM)  annotation (Line(
      points={{-30.4,-6.4},{60,-6.4},{60,-40},{100,-40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pre1.u, m1.FtoM) annotation (Line(
      points={{-5.8783e-016,4.4},{-5.8783e-016,-20},{60,-20},{60,-40},{100,
          -40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pre1.y, or2.u2)  annotation (Line(
      points={{5.38845e-016,22.8},{5.38845e-016,33.6},{30.4,33.6}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pre2.y, or1.u2)  annotation (Line(
      points={{4.8,-30},{18,-30},{18,-33.6},{30.4,-33.6}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pre2.u, m2.FtoM) annotation (Line(
      points={{-13.6,-30},{-20,-30},{-20,0},{60,0},{60,40},{100,40}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(graphics), Icon(graphics={Text(
          extent={{-52,-24},{60,24}},
          lineColor={255,255,255},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          textString="AND")}));
end TwoToOneOr;
