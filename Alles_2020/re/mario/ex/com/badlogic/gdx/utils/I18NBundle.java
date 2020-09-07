package com.badlogic.gdx.utils;

import com.badlogic.gdx.files.FileHandle;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.MissingResourceException;

public class I18NBundle {
  private static final String DEFAULT_ENCODING = "UTF-8";
  
  private static final Locale ROOT_LOCALE = new Locale("", "", "");
  
  private static boolean exceptionOnMissingKey;
  
  private static boolean simpleFormatter = false;
  
  private TextFormatter formatter;
  
  private Locale locale;
  
  private I18NBundle parent;
  
  private ObjectMap<String, String> properties;
  
  static  {
    exceptionOnMissingKey = true;
  }
  
  private static boolean checkFileExistence(FileHandle paramFileHandle) {
    try {
      paramFileHandle.read().close();
      return true;
    } catch (Exception paramFileHandle) {
      return false;
    } 
  }
  
  public static I18NBundle createBundle(FileHandle paramFileHandle) { return createBundleImpl(paramFileHandle, Locale.getDefault(), "UTF-8"); }
  
  public static I18NBundle createBundle(FileHandle paramFileHandle, String paramString) { return createBundleImpl(paramFileHandle, Locale.getDefault(), paramString); }
  
  public static I18NBundle createBundle(FileHandle paramFileHandle, Locale paramLocale) { return createBundleImpl(paramFileHandle, paramLocale, "UTF-8"); }
  
  public static I18NBundle createBundle(FileHandle paramFileHandle, Locale paramLocale, String paramString) { return createBundleImpl(paramFileHandle, paramLocale, paramString); }
  
  private static I18NBundle createBundleImpl(FileHandle paramFileHandle, Locale paramLocale, String paramString) {
    if (paramFileHandle != null && paramLocale != null && paramString != null) {
      I18NBundle i18NBundle3;
      I18NBundle i18NBundle2;
      Locale locale2;
      I18NBundle i18NBundle1 = null;
      Locale locale1 = paramLocale;
      do {
        List list = getCandidateLocales(locale1);
        i18NBundle2 = loadBundleChain(paramFileHandle, paramString, list, 0, i18NBundle1);
        i18NBundle3 = i18NBundle1;
        if (i18NBundle2 != null) {
          Locale locale3 = i18NBundle2.getLocale();
          boolean bool = locale3.equals(ROOT_LOCALE);
          i18NBundle3 = i18NBundle1;
          if (bool) {
            if (locale3.equals(paramLocale)) {
              i18NBundle3 = i18NBundle1;
              break;
            } 
            if (list.size() == 1 && locale3.equals(list.get(0))) {
              i18NBundle3 = i18NBundle1;
              break;
            } 
            i18NBundle3 = i18NBundle1;
            if (bool) {
              i18NBundle3 = i18NBundle1;
              if (i18NBundle1 == null)
                i18NBundle3 = i18NBundle2; 
            } 
          } else {
            break;
          } 
        } 
        locale2 = getFallbackLocale(locale1);
        locale1 = locale2;
        i18NBundle1 = i18NBundle3;
      } while (locale2 != null);
      if (i18NBundle2 == null) {
        if (i18NBundle3 == null) {
          java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append("Can't find bundle for base file handle ");
          stringBuilder.append(paramFileHandle.path());
          stringBuilder.append(", locale ");
          stringBuilder.append(paramLocale);
          String str = stringBuilder.toString();
          stringBuilder = new java.lang.StringBuilder();
          stringBuilder.append(paramFileHandle);
          stringBuilder.append("_");
          stringBuilder.append(paramLocale);
          throw new MissingResourceException(str, stringBuilder.toString(), "");
        } 
      } else {
        i18NBundle3 = i18NBundle2;
      } 
      return i18NBundle3;
    } 
    NullPointerException nullPointerException = new NullPointerException();
    throw nullPointerException;
  }
  
  private static List<Locale> getCandidateLocales(Locale paramLocale) {
    String str1 = paramLocale.getLanguage();
    String str2 = paramLocale.getCountry();
    String str3 = paramLocale.getVariant();
    ArrayList arrayList = new ArrayList(4);
    if (str3.length() > 0)
      arrayList.add(paramLocale); 
    if (str2.length() > 0) {
      Locale locale1;
      if (arrayList.isEmpty()) {
        locale1 = paramLocale;
      } else {
        locale1 = new Locale(str1, locale1);
      } 
      arrayList.add(locale1);
    } 
    if (str1.length() > 0) {
      if (!arrayList.isEmpty())
        paramLocale = new Locale(str1); 
      arrayList.add(paramLocale);
    } 
    arrayList.add(ROOT_LOCALE);
    return arrayList;
  }
  
  public static boolean getExceptionOnMissingKey() { return exceptionOnMissingKey; }
  
  private static Locale getFallbackLocale(Locale paramLocale) {
    Locale locale1 = Locale.getDefault();
    Locale locale2 = locale1;
    if (paramLocale.equals(locale1))
      locale2 = null; 
    return locale2;
  }
  
  public static boolean getSimpleFormatter() { return simpleFormatter; }
  
  private static I18NBundle loadBundle(FileHandle paramFileHandle, String paramString, Locale paramLocale) {
    Object object1 = null;
    Object object2 = null;
    I18NBundle i18NBundle = null;
    Reader reader1 = object1;
    Reader reader2 = object2;
    try {
      I18NBundle i18NBundle1;
      paramFileHandle = toFileHandle(paramFileHandle, paramLocale);
      reader1 = object1;
      reader2 = object2;
      if (checkFileExistence(paramFileHandle)) {
        reader1 = object1;
        reader2 = object2;
        i18NBundle = new I18NBundle();
        reader1 = object1;
        reader2 = object2;
        this();
        reader1 = object1;
        reader2 = object2;
        i18NBundle1 = paramFileHandle.reader(paramString);
        reader1 = i18NBundle1;
        reader2 = i18NBundle1;
        i18NBundle.load(i18NBundle1);
        I18NBundle i18NBundle2 = i18NBundle;
      } else {
        paramString = null;
        i18NBundle1 = i18NBundle;
      } 
      StreamUtils.closeQuietly(i18NBundle1);
      if (paramString != null)
        paramString.setLocale(paramLocale); 
      return paramString;
    } catch (IOException paramString) {
      reader1 = reader2;
      GdxRuntimeException gdxRuntimeException = new GdxRuntimeException();
      reader1 = reader2;
      this(paramString);
      reader1 = reader2;
      throw gdxRuntimeException;
    } finally {}
    StreamUtils.closeQuietly(reader1);
    throw paramFileHandle;
  }
  
  private static I18NBundle loadBundleChain(FileHandle paramFileHandle, String paramString, List<Locale> paramList, int paramInt, I18NBundle paramI18NBundle) {
    Locale locale1 = (Locale)paramList.get(paramInt);
    if (paramInt != paramList.size() - 1) {
      I18NBundle i18NBundle1 = loadBundleChain(paramFileHandle, paramString, paramList, paramInt + 1, paramI18NBundle);
    } else {
      if (paramI18NBundle != null && locale1.equals(ROOT_LOCALE))
        return paramI18NBundle; 
      paramList = null;
    } 
    I18NBundle i18NBundle = loadBundle(paramFileHandle, paramString, locale1);
    if (i18NBundle != null) {
      i18NBundle.parent = paramList;
      return i18NBundle;
    } 
    return paramList;
  }
  
  public static void setExceptionOnMissingKey(boolean paramBoolean) { exceptionOnMissingKey = paramBoolean; }
  
  private void setLocale(Locale paramLocale) {
    this.locale = paramLocale;
    this.formatter = new TextFormatter(paramLocale, simpleFormatter ^ true);
  }
  
  public static void setSimpleFormatter(boolean paramBoolean) { simpleFormatter = paramBoolean; }
  
  private static FileHandle toFileHandle(FileHandle paramFileHandle, Locale paramLocale) {
    StringBuilder stringBuilder = new StringBuilder(paramFileHandle.name());
    if (!paramLocale.equals(ROOT_LOCALE)) {
      String str2 = paramLocale.getLanguage();
      String str3 = paramLocale.getCountry();
      String str1 = paramLocale.getVariant();
      boolean bool1 = "".equals(str2);
      boolean bool2 = "".equals(str3);
      boolean bool3 = "".equals(str1);
      if (!bool1 || !bool2 || !bool3) {
        stringBuilder.append('_');
        if (!bool3) {
          stringBuilder.append(str2).append('_').append(str3).append('_').append(str1);
        } else if (!bool2) {
          stringBuilder.append(str2).append('_').append(str3);
        } else {
          stringBuilder.append(str2);
        } 
      } 
    } 
    return paramFileHandle.sibling(stringBuilder.append(".properties").toString());
  }
  
  public void debug(String paramString) {
    ObjectMap.Keys keys = this.properties.keys();
    if (keys == null)
      return; 
    keys = keys.iterator();
    while (keys.hasNext()) {
      String str = (String)keys.next();
      this.properties.put(str, paramString);
    } 
  }
  
  public String format(String paramString, Object... paramVarArgs) { return this.formatter.format(get(paramString), paramVarArgs); }
  
  public final String get(String paramString) {
    String str1 = (String)this.properties.get(paramString);
    String str2 = str1;
    if (str1 == null) {
      I18NBundle i18NBundle = this.parent;
      if (i18NBundle != null)
        str1 = i18NBundle.get(paramString); 
      str2 = str1;
      if (str1 == null) {
        if (!exceptionOnMissingKey) {
          java.lang.StringBuilder stringBuilder1 = new java.lang.StringBuilder();
          stringBuilder1.append("???");
          stringBuilder1.append(paramString);
          stringBuilder1.append("???");
          return stringBuilder1.toString();
        } 
        java.lang.StringBuilder stringBuilder = new java.lang.StringBuilder();
        stringBuilder.append("Can't find bundle key ");
        stringBuilder.append(paramString);
        throw new MissingResourceException(stringBuilder.toString(), getClass().getName(), paramString);
      } 
    } 
    return str2;
  }
  
  public Locale getLocale() { return this.locale; }
  
  protected void load(Reader paramReader) throws IOException {
    this.properties = new ObjectMap();
    PropertiesUtils.load(this.properties, paramReader);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/utils/I18NBundle.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */