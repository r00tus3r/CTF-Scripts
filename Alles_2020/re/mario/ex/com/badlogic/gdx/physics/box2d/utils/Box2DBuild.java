package com.badlogic.gdx.physics.box2d.utils;

import com.badlogic.gdx.jnigen.AntScriptGenerator;
import com.badlogic.gdx.jnigen.BuildConfig;
import com.badlogic.gdx.jnigen.BuildTarget;
import com.badlogic.gdx.jnigen.NativeCodeGenerator;
import java.io.File;

public class Box2DBuild {
  public static void main(String[] paramArrayOfString) throws Exception {
    BuildTarget buildTarget1;
    BuildTarget buildTarget2;
    BuildTarget buildTarget3;
    BuildTarget buildTarget4;
    BuildTarget buildTarget5;
    BuildTarget buildTarget6;
    BuildTarget buildTarget7 = (buildTarget6 = (buildTarget5 = (buildTarget4 = (buildTarget1 = (buildTarget3 = (buildTarget2 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Windows, false)).newDefaultTarget(BuildTarget.TargetOs.Windows, true)).newDefaultTarget(BuildTarget.TargetOs.Linux, false)).newDefaultTarget(BuildTarget.TargetOs.Linux, true)).newDefaultTarget(BuildTarget.TargetOs.Android, false)).newDefaultTarget(BuildTarget.TargetOs.MacOsX, true)).newDefaultTarget(BuildTarget.TargetOs.IOS, false);
    NativeCodeGenerator nativeCodeGenerator = new NativeCodeGenerator();
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("bin");
    stringBuilder.append(File.pathSeparator);
    stringBuilder.append("../../../gdx/bin");
    nativeCodeGenerator.generate("src", stringBuilder.toString(), "jni");
    (new AntScriptGenerator()).generate(new BuildConfig("gdx-box2d"), new BuildTarget[] { buildTarget2, buildTarget3, buildTarget1, buildTarget4, buildTarget6, buildTarget5, buildTarget7 });
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/utils/Box2DBuild.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */