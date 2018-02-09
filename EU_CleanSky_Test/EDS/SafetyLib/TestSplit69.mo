within EU_CleanSky_Test.EDS.SafetyLib;
model TestSplit69 "Split high - with leaks"
  import EU_CleanSky.EDS.SafetyLib;

  EU_CleanSky.EDS.SafetyLib.Split split1
    annotation (Placement(transformation(extent={{-20,30},{0,50}})));
  EU_CleanSky.EDS.SafetyLib.Link link2(useOpen=false, useLeak=false)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-10,-10})));
  EU_CleanSky.EDS.SafetyLib.Sources.HiPotential sourceP
    annotation (Placement(transformation(extent={{-100,30},{-80,50}})));
  EU_CleanSky.EDS.SafetyLib.Sources.LoPotential sink annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,40})));
  EU_CleanSky.EDS.SafetyLib.PolarisedLoad load(
    semantics=EU_CleanSky.EDS.SafetyLib.Semantics.electrical,
    useLeak=false,
    useOpen=false,
    final useReverseInterface=false)
    annotation (Placement(transformation(extent={{50,30},{70,50}})));
  EU_CleanSky.EDS.SafetyLib.Sources.HiPotential sink1(gender=EU_CleanSky.EDS.SafetyLib.Gender.male)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-50})));

  EU_CleanSky.EDS.SafetyLib.Link link1(useOpen=false, useLeak=true)
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  EU_CleanSky.EDS.SafetyLib.Link link3(useOpen=false, useLeak=true)
    annotation (Placement(transformation(extent={{20,30},{40,50}})));
  Modelica.Blocks.Sources.BooleanExpression expr(y=true)
    annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
equation
  connect(split1.f2, link2.p) annotation (Line(
      points={{-10,32},{-10,16},{-10,0},{-10,0}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sink.m, load.minusF) annotation (Line(
      points={{80,40},{80,40},{80,40},{70,40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sink1.m, link2.n) annotation (Line(
      points={{-10,-40},{-10,-20}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(link1.n, split1.m) annotation (Line(
      points={{-40,40},{-20,40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(link1.p, sourceP.f) annotation (Line(
      points={{-60,40},{-80,40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(link3.n, load.plusM) annotation (Line(
      points={{40,40},{50,40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(split1.f1, link3.p) annotation (Line(
      points={{0,40},{20,40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(expr.y, link1.leak) annotation (Line(
      points={{-79,20},{-48,20},{-48,36}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(expr.y, link3.leak) annotation (Line(
      points={{-79,20},{32,20},{32,36}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-110,-100},{110,
            100}}), graphics),
    experiment(NumberOfIntervals=2),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<p>When a leak is created in &QUOT;link2&QUOT;, the load continues to run although spent power is evacuated to the environment through the leak.</p>
<p>The condition for a load to be correctly powered from a power system are:</p>
<p><ul>
<li>It must receive a low signal on its N side and a high signal on its P side.</li>
<li>It must not receive a ground signal on both N and P.</li>
<li>It must not be traversed by an &QUOT;open&QUOT; signal in either direction, since that indicates a blocked flow / open circuit.</li>
</ul></p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-110,-100},{110,
            100}})));
end TestSplit69;
