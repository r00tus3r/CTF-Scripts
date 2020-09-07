package com.badlogic.gdx.utils;

import com.badlogic.gdx.jnigen.AntScriptGenerator;
import com.badlogic.gdx.jnigen.BuildConfig;
import com.badlogic.gdx.jnigen.BuildTarget;
import com.badlogic.gdx.jnigen.NativeCodeGenerator;

public class GdxBuild {
  public static void main(String[] paramArrayOfString) throws Exception {
    (new NativeCodeGenerator()).generate("src", "bin", "jni", new String[] { "**/*" }, null);
    String[] arrayOfString = new String[1];
    arrayOfString[0] = "iosgl/**";
    BuildTarget buildTarget3 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Windows, false);
    buildTarget3.compilerPrefix = "";
    buildTarget3.buildFileName = "build-windows32home.xml";
    buildTarget3.excludeFromMasterBuildFile = true;
    buildTarget3.cppExcludes = arrayOfString;
    BuildTarget buildTarget4 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Windows, false);
    buildTarget4.cppExcludes = arrayOfString;
    BuildTarget buildTarget5 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Windows, true);
    buildTarget5.cppExcludes = arrayOfString;
    BuildTarget buildTarget6 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Linux, false);
    buildTarget6.cppExcludes = arrayOfString;
    BuildTarget buildTarget1 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Linux, true);
    buildTarget1.cppExcludes = arrayOfString;
    BuildTarget buildTarget7 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.Android, false);
    java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
    stringBuilder.append(buildTarget7.linkerFlags);
    stringBuilder.append(" -llog");
    buildTarget7.linkerFlags = stringBuilder.toString();
    buildTarget7.cppExcludes = arrayOfString;
    BuildTarget buildTarget8 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.MacOsX, true);
    buildTarget8.cppExcludes = arrayOfString;
    BuildTarget buildTarget2 = BuildTarget.newDefaultTarget(BuildTarget.TargetOs.IOS, false);
    buildTarget2.headerDirs = new String[] { "iosgl" };
    (new AntScriptGenerator()).generate(new BuildConfig("gdx", "../target/native", "libs", "jni"), new BuildTarget[] { buildTarget8, buildTarget3, buildTarget4, buildTarget5, buildTarget6, buildTarget1, buildTarget7, buildTarget2 });
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/GdxBuild.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */