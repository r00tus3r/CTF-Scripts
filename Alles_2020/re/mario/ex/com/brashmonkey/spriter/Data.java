package com.brashmonkey.spriter;

import java.util.ArrayList;

public class Data {
  final Entity[] entities;
  
  private int entityPointer = 0;
  
  private int folderPointer = 0;
  
  final Folder[] folders;
  
  public final String generator;
  
  public final String generatorVersion;
  
  public final String scmlVersion;
  
  Data(String paramString1, String paramString2, String paramString3, int paramInt1, int paramInt2) {
    this.scmlVersion = paramString1;
    this.generator = paramString2;
    this.generatorVersion = paramString3;
    this.folders = new Folder[paramInt1];
    this.entities = new Entity[paramInt2];
  }
  
  void addEntity(Entity paramEntity) {
    Entity[] arrayOfEntity = this.entities;
    int i = this.entityPointer;
    this.entityPointer = i + 1;
    arrayOfEntity[i] = paramEntity;
  }
  
  void addFolder(Folder paramFolder) {
    Folder[] arrayOfFolder = this.folders;
    int i = this.folderPointer;
    this.folderPointer = i + 1;
    arrayOfFolder[i] = paramFolder;
  }
  
  public ArrayList<String> getEntities() {
    ArrayList arrayList = new ArrayList(this.entities.length);
    byte b = 0;
    while (true) {
      Entity[] arrayOfEntity = this.entities;
      if (b < arrayOfEntity.length) {
        arrayList.add((arrayOfEntity[b]).name);
        b++;
        continue;
      } 
      break;
    } 
    return arrayList;
  }
  
  public Entity getEntity(int paramInt) { return this.entities[paramInt]; }
  
  public Entity getEntity(String paramString) {
    int i = getEntityIndex(paramString);
    return (i >= 0) ? getEntity(i) : null;
  }
  
  int getEntityIndex(String paramString) {
    for (Entity entity : this.entities) {
      if (entity.name.equals(paramString))
        return entity.id; 
    } 
    return -1;
  }
  
  public File getFile(int paramInt1, int paramInt2) { return getFile(getFolder(paramInt1), paramInt2); }
  
  public File getFile(FileReference paramFileReference) { return getFile(paramFileReference.folder, paramFileReference.file); }
  
  public File getFile(Folder paramFolder, int paramInt) { return paramFolder.getFile(paramInt); }
  
  Folder getFolder(int paramInt) { return this.folders[paramInt]; }
  
  public Folder getFolder(String paramString) {
    int i = getFolderIndex(paramString);
    return (i >= 0) ? getFolder(i) : null;
  }
  
  int getFolderIndex(String paramString) {
    for (Folder folder : this.folders) {
      if (folder.name.equals(paramString))
        return folder.id; 
    } 
    return -1;
  }
  
  public String toString() {
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append(getClass().getSimpleName());
    stringBuilder1.append("|[Version: ");
    stringBuilder1.append(this.scmlVersion);
    stringBuilder1.append(", Generator: ");
    stringBuilder1.append(this.generator);
    stringBuilder1.append(" (");
    stringBuilder1.append(this.generatorVersion);
    stringBuilder1.append(")]");
    String str = stringBuilder1.toString();
    Folder[] arrayOfFolder = this.folders;
    int i = arrayOfFolder.length;
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b2 < i; b2++) {
      Folder folder = arrayOfFolder[b2];
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str);
      stringBuilder.append("\n");
      stringBuilder.append(folder);
      str = stringBuilder.toString();
    } 
    Entity[] arrayOfEntity = this.entities;
    i = arrayOfEntity.length;
    for (b2 = b1; b2 < i; b2++) {
      Entity entity = arrayOfEntity[b2];
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str);
      stringBuilder.append("\n");
      stringBuilder.append(entity);
      str = stringBuilder.toString();
    } 
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append(str);
    stringBuilder2.append("]");
    return stringBuilder2.toString();
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/Data.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */