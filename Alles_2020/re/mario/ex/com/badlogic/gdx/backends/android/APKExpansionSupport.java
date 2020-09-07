package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.os.Environment;
import java.io.File;
import java.io.IOException;
import java.util.Vector;

public class APKExpansionSupport {
  private static final String EXP_PATH = "/Android/obb/";
  
  static String[] getAPKExpansionFiles(Context paramContext, int paramInt1, int paramInt2) {
    String str = paramContext.getPackageName();
    Vector vector = new Vector();
    if (Environment.getExternalStorageState().equals("mounted")) {
      File file1 = Environment.getExternalStorageDirectory();
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(file1.toString());
      stringBuilder.append("/Android/obb/");
      stringBuilder.append(str);
      File file2 = new File(stringBuilder.toString());
      if (file2.exists()) {
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(file2);
        stringBuilder2.append(File.separator);
        stringBuilder2.append("main.");
        stringBuilder2.append(paramInt1);
        stringBuilder2.append(".");
        stringBuilder2.append(str);
        stringBuilder2.append(".obb");
        String str1 = stringBuilder2.toString();
        if (paramInt1 > 0 && (new File(str1)).isFile())
          vector.add(str1); 
        StringBuilder stringBuilder1 = new StringBuilder();
        stringBuilder1.append(file2);
        stringBuilder1.append(File.separator);
        stringBuilder1.append("patch.");
        stringBuilder1.append(paramInt2);
        stringBuilder1.append(".");
        stringBuilder1.append(str);
        stringBuilder1.append(".obb");
        str = stringBuilder1.toString();
        if (paramInt2 > 0 && (new File(str)).isFile())
          vector.add(str); 
      } 
    } 
    String[] arrayOfString = new String[vector.size()];
    vector.toArray(arrayOfString);
    return arrayOfString;
  }
  
  public static ZipResourceFile getAPKExpansionZipFile(Context paramContext, int paramInt1, int paramInt2) throws IOException { return getResourceZipFile(getAPKExpansionFiles(paramContext, paramInt1, paramInt2)); }
  
  public static ZipResourceFile getResourceZipFile(String[] paramArrayOfString) throws IOException {
    int i = paramArrayOfString.length;
    ZipResourceFile zipResourceFile = null;
    for (byte b = 0; b < i; b++) {
      String str = paramArrayOfString[b];
      if (zipResourceFile == null) {
        zipResourceFile = new ZipResourceFile(str);
      } else {
        zipResourceFile.addPatchFile(str);
      } 
    } 
    return zipResourceFile;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/backends/android/APKExpansionSupport.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */