package com.brashmonkey.spriter;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class Spriter {
  private static Drawer<?> drawer;
  
  private static Object[] drawerDependencies;
  
  private static Class<?>[] drawerTypes;
  
  private static final HashMap<Entity, Loader> entityToLoader;
  
  private static boolean initialized;
  
  private static final HashMap<String, Data> loadedData;
  
  private static Class<? extends Loader> loaderClass;
  
  private static Object[] loaderDependencies = new Object[1];
  
  private static Class<?>[] loaderTypes;
  
  private static final List<Loader> loaders;
  
  private static final List<Player> players;
  
  static  {
    drawerDependencies = new Object[1];
    loaderTypes = new Class[1];
    drawerTypes = new Class[1];
    loaderTypes[0] = Data.class;
    drawerTypes[0] = Loader.class;
    loadedData = new HashMap();
    players = new ArrayList();
    loaders = new ArrayList();
    entityToLoader = new HashMap();
    initialized = false;
  }
  
  public static void dispose() {
    drawer = null;
    drawerDependencies = new Object[1];
    drawerTypes = new Class[1];
    drawerTypes[0] = Loader.class;
    entityToLoader.clear();
    Iterator iterator = loaders.iterator();
    while (iterator.hasNext())
      ((Loader)iterator.next()).dispose(); 
    loaders.clear();
    loadedData.clear();
    loaderClass = null;
    loaderTypes = new Class[1];
    loaderTypes[0] = Data.class;
    loaderDependencies = new Object[1];
    players.clear();
    initialized = false;
  }
  
  public static void draw() {
    if (initialized) {
      for (Player player : players) {
        drawer.loader = (Loader)entityToLoader.get(player.getEntity());
        drawer.draw(player);
      } 
      return;
    } 
    SpriterException spriterException = new SpriterException("Call init() before drawing!");
    throw spriterException;
  }
  
  public static Drawer drawer() { return drawer; }
  
  public static Data getData(String paramString) { return (Data)loadedData.get(paramString); }
  
  public static Loader<?> getLoader(String paramString) { return (Loader)entityToLoader.get(getData(paramString).getEntity(0)); }
  
  public static void init(Class<? extends Loader> paramClass1, Class<? extends Drawer> paramClass2) {
    boolean bool;
    loaderClass = paramClass1;
    try {
      drawer = (Drawer)paramClass2.getDeclaredConstructor(drawerTypes).newInstance(drawerDependencies);
    } catch (Exception paramClass1) {
      paramClass1.printStackTrace();
    } 
    if (drawer != null) {
      bool = true;
    } else {
      bool = false;
    } 
    initialized = bool;
  }
  
  public static void load(File paramFile) {
    try {
      FileInputStream fileInputStream = new FileInputStream();
      this(paramFile);
      load(fileInputStream, paramFile.getPath().replaceAll("\\\\", "/"));
    } catch (FileNotFoundException paramFile) {
      paramFile.printStackTrace();
    } 
  }
  
  public static void load(InputStream paramInputStream, String paramString) {
    Data data = (new SCMLReader(paramInputStream)).data;
    loadedData.put(paramString, data);
    arrayOfObject = loaderDependencies;
    byte b = 0;
    arrayOfObject[0] = data;
    try {
      Loader loader = (Loader)loaderClass.getDeclaredConstructor(loaderTypes).newInstance(loaderDependencies);
      File file = new File();
      this(paramString);
      loader.load(file);
      loaders.add(loader);
      Entity[] arrayOfEntity = data.entities;
      int i = arrayOfEntity.length;
      while (b < i) {
        Entity entity = arrayOfEntity[b];
        entityToLoader.put(entity, loader);
        b++;
      } 
    } catch (Exception arrayOfObject) {
      arrayOfObject.printStackTrace();
    } 
  }
  
  public static void load(String paramString) { load(new File(paramString)); }
  
  public static Player newPlayer(String paramString, int paramInt) { return newPlayer(paramString, paramInt, Player.class); }
  
  public static Player newPlayer(String paramString, int paramInt, Class<? extends Player> paramClass) {
    if (loadedData.containsKey(paramString))
      try {
        Player player = (Player)paramClass.getDeclaredConstructor(new Class[] { Entity.class }).newInstance(new Object[] { ((Data)loadedData.get(paramString)).getEntity(paramInt) });
        players.add(player);
        return player;
      } catch (Exception paramString) {
        paramString.printStackTrace();
        return null;
      }  
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("You have to load \"");
    stringBuilder.append(paramString);
    stringBuilder.append("\" before using it!");
    throw new SpriterException(stringBuilder.toString());
  }
  
  public static Player newPlayer(String paramString1, String paramString2) {
    if (loadedData.containsKey(paramString1))
      return newPlayer(paramString1, ((Data)loadedData.get(paramString1)).getEntityIndex(paramString2)); 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("You have to load \"");
    stringBuilder.append(paramString1);
    stringBuilder.append("\" before using it!");
    throw new SpriterException(stringBuilder.toString());
  }
  
  public static int players() { return players.size(); }
  
  public static void setDrawerDependencies(Object... paramVarArgs) {
    if (paramVarArgs == null)
      return; 
    drawerDependencies = new Object[paramVarArgs.length + 1];
    Object[] arrayOfObject = drawerDependencies;
    byte b = 0;
    arrayOfObject[0] = null;
    System.arraycopy(paramVarArgs, 0, arrayOfObject, 1, paramVarArgs.length);
    drawerTypes = new Class[paramVarArgs.length + 1];
    drawerTypes[0] = Loader.class;
    while (b < paramVarArgs.length) {
      if (paramVarArgs[b] != null)
        drawerTypes[b + true] = paramVarArgs[b].getClass(); 
      b++;
    } 
  }
  
  public static void setLoaderDependencies(Object... paramVarArgs) {
    if (paramVarArgs == null)
      return; 
    loaderDependencies = new Object[paramVarArgs.length + 1];
    Object[] arrayOfObject = loaderDependencies;
    int i = paramVarArgs.length;
    int j = 0;
    System.arraycopy(paramVarArgs, 0, arrayOfObject, 1, i);
    loaderTypes = new Class[paramVarArgs.length + 1];
    loaderTypes[0] = Data.class;
    while (j < paramVarArgs.length) {
      Class[] arrayOfClass = loaderTypes;
      i = j + true;
      arrayOfClass[i] = paramVarArgs[j].getClass();
      j = i;
    } 
  }
  
  public static void update() {
    if (initialized) {
      Iterator iterator = players.iterator();
      while (iterator.hasNext())
        ((Player)iterator.next()).update(); 
      return;
    } 
    SpriterException spriterException = new SpriterException("Call init() before updating!");
    throw spriterException;
  }
  
  public static void updateAndDraw() {
    if (initialized) {
      for (Player player : players) {
        player.update();
        drawer.loader = (Loader)entityToLoader.get(player.getEntity());
        drawer.draw(player);
      } 
      return;
    } 
    SpriterException spriterException = new SpriterException("Call init() before updating!");
    throw spriterException;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Spriter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */