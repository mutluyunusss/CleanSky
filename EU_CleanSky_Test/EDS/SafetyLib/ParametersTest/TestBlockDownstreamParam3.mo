within EU_CleanSky_Test.EDS.SafetyLib.ParametersTest;
model TestBlockDownstreamParam3
  "Check that model is valid for all parameter values."
  import EU_CleanSky.EDS.SafetyLib;
  extends EU_CleanSky.EDS.SafetyLib.Internal.BlockDownstream(useInput=true,
      useStatus=false);
end TestBlockDownstreamParam3;
