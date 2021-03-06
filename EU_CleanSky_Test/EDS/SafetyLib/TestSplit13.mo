within EU_CleanSky_Test.EDS.SafetyLib;
model TestSplit13 "Split high / Power one load from two sources."
  import EU_CleanSky.EDS.SafetyLib;

  EU_CleanSky.EDS.SafetyLib.Split split1
    annotation (Placement(transformation(extent={{-20,30},{0,50}})));
  EU_CleanSky.EDS.SafetyLib.PolarisedLoad load(
    semantics=EU_CleanSky.EDS.SafetyLib.Semantics.electrical,
    useLeak=false,
    useOpen=false,
    final useReverseInterface=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-10,-10})));
  EU_CleanSky.EDS.SafetyLib.Sources.LoPotential sink annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,40})));

  EU_CleanSky.EDS.SafetyLib.Link link2(useOpen=false, useLeak=false)
    annotation (Placement(transformation(extent={{20,30},{40,50}})));
  EU_CleanSky.EDS.SafetyLib.Sources.LoPotential sinkP annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-50})));
  EU_CleanSky.EDS.SafetyLib.Sources.HiPotential logicFlowPCap
    annotation (Placement(transformation(extent={{-100,30},{-80,50}})));
  EU_CleanSky.EDS.SafetyLib.Link link1(useOpen=false, useLeak=false)
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
equation
  connect(logicFlowPCap.f, link1.m) annotation (Line(
      points={{-80,40},{-60,40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(link1.f, split1.m) annotation (Line(
      points={{-40,40},{-20,40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(split1.f1, link2.m) annotation (Line(
      points={{0,40},{20,40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(link2.f, sink.m) annotation (Line(
      points={{40,40},{60,40}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(split1.f2, load.m) annotation (Line(
      points={{-10,32},{-10,0}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(load.f, sinkP.m) annotation (Line(
      points={{-10,-20},{-10,-40}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
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
</html>"));
end TestSplit13;
