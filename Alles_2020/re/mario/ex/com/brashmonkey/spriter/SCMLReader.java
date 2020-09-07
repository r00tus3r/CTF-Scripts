package com.brashmonkey.spriter;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;

public class SCMLReader {
  protected Data data;
  
  public SCMLReader(InputStream paramInputStream) { this.data = load(paramInputStream); }
  
  public SCMLReader(String paramString) { this.data = load(paramString); }
  
  public Data getData() { return this.data; }
  
  protected Data load(InputStream paramInputStream) {
    XmlReader xmlReader = new XmlReader();
    try {
      XmlReader.Element element = xmlReader.parse(paramInputStream);
      ArrayList arrayList1 = element.getChildrenByName("folder");
      ArrayList arrayList2 = element.getChildrenByName("entity");
      Data data1 = new Data();
      this(element.get("scml_version"), element.get("generator"), element.get("generator_version"), arrayList1.size(), arrayList2.size());
      this.data = data1;
      loadFolders(arrayList1);
      loadEntities(arrayList2);
    } catch (IOException paramInputStream) {
      paramInputStream.printStackTrace();
    } 
    return this.data;
  }
  
  protected Data load(String paramString) {
    XmlReader.Element element = (new XmlReader()).parse(paramString);
    ArrayList arrayList2 = element.getChildrenByName("folder");
    ArrayList arrayList1 = element.getChildrenByName("entity");
    this.data = new Data(element.get("scml_version"), element.get("generator"), element.get("generator_version"), arrayList2.size(), arrayList1.size());
    loadFolders(arrayList2);
    loadEntities(arrayList1);
    return this.data;
  }
  
  protected void loadAnimations(ArrayList<XmlReader.Element> paramArrayList, Entity paramEntity) {
    for (byte b = 0; b < paramArrayList.size(); b++) {
      XmlReader.Element element = (XmlReader.Element)paramArrayList.get(b);
      ArrayList arrayList1 = element.getChildrenByName("timeline");
      ArrayList arrayList2 = element.getChildByName("mainline").getChildrenByName("key");
      Animation animation = new Animation(new Mainline(arrayList2.size()), element.getInt("id"), element.get("name"), element.getInt("length"), element.getBoolean("looping", true), arrayList1.size());
      paramEntity.addAnimation(animation);
      loadMainlineKeys(arrayList2, animation.mainline);
      loadTimelines(arrayList1, animation, paramEntity);
      animation.prepare();
    } 
  }
  
  protected void loadCharacterMaps(ArrayList<XmlReader.Element> paramArrayList, Entity paramEntity) {
    for (byte b = 0; b < paramArrayList.size(); b++) {
      XmlReader.Element element = (XmlReader.Element)paramArrayList.get(b);
      int i = element.getInt("id");
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("charMap");
      stringBuilder.append(b);
      Entity.CharacterMap characterMap = new Entity.CharacterMap(i, element.getAttribute("name", stringBuilder.toString()));
      paramEntity.addCharacterMap(characterMap);
      for (XmlReader.Element element1 : element.getChildrenByName("map")) {
        int j = element1.getInt("folder");
        i = element1.getInt("file");
        characterMap.put(new FileReference(j, i), new FileReference(element1.getInt("target_folder", j), element1.getInt("target_file", i)));
      } 
    } 
  }
  
  protected void loadEntities(ArrayList<XmlReader.Element> paramArrayList) {
    for (byte b = 0; b < paramArrayList.size(); b++) {
      XmlReader.Element element = (XmlReader.Element)paramArrayList.get(b);
      ArrayList arrayList1 = element.getChildrenByName("obj_info");
      ArrayList arrayList2 = element.getChildrenByName("character_map");
      ArrayList arrayList3 = element.getChildrenByName("animation");
      Entity entity = new Entity(element.getInt("id"), element.get("name"), arrayList3.size(), arrayList2.size(), arrayList1.size());
      this.data.addEntity(entity);
      loadObjectInfos(arrayList1, entity);
      loadCharacterMaps(arrayList2, entity);
      loadAnimations(arrayList3, entity);
    } 
  }
  
  protected void loadFiles(ArrayList<XmlReader.Element> paramArrayList, Folder paramFolder) {
    for (byte b = 0; b < paramArrayList.size(); b++) {
      XmlReader.Element element = (XmlReader.Element)paramArrayList.get(b);
      paramFolder.addFile(new File(element.getInt("id"), element.get("name"), new Dimension(element.getInt("width", 0), element.getInt("height", 0)), new Point(element.getFloat("pivot_x", 0.0F), element.getFloat("pivot_y", 1.0F))));
    } 
  }
  
  protected void loadFolders(ArrayList<XmlReader.Element> paramArrayList) {
    for (byte b = 0; b < paramArrayList.size(); b++) {
      XmlReader.Element element = (XmlReader.Element)paramArrayList.get(b);
      ArrayList arrayList = element.getChildrenByName("file");
      int i = element.getInt("id");
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("no_name_");
      stringBuilder.append(b);
      Folder folder = new Folder(i, element.get("name", stringBuilder.toString()), arrayList.size());
      loadFiles(arrayList, folder);
      this.data.addFolder(folder);
    } 
  }
  
  protected void loadMainlineKeys(ArrayList<XmlReader.Element> paramArrayList, Mainline paramMainline) {
    for (byte b = 0; b < paramMainline.keys.length; b++) {
      XmlReader.Element element = (XmlReader.Element)paramArrayList.get(b);
      ArrayList arrayList1 = element.getChildrenByName("object_ref");
      ArrayList arrayList2 = element.getChildrenByName("bone_ref");
      Curve curve;
      curve.setType((curve = new Curve()).getType(element.get("curve_type", "linear")));
      curve.constraints.set(element.getFloat("c1", 0.0F), element.getFloat("c2", 0.0F), element.getFloat("c3", 0.0F), element.getFloat("c4", 0.0F));
      Mainline.Key key = new Mainline.Key(element.getInt("id"), element.getInt("time", 0), curve, arrayList2.size(), arrayList1.size());
      paramMainline.addKey(key);
      loadRefs(arrayList1, arrayList2, key);
    } 
  }
  
  protected void loadObjectInfos(ArrayList<XmlReader.Element> paramArrayList, Entity paramEntity) {
    for (byte b = 0; b < paramArrayList.size(); b++) {
      element = (XmlReader.Element)paramArrayList.get(b);
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("info");
      stringBuilder.append(b);
      Entity.ObjectInfo objectInfo = new Entity.ObjectInfo(element.get("name", stringBuilder.toString()), Entity.ObjectType.getObjectInfoFor(element.get("type", "")), new Dimension(element.getFloat("w", 0.0F), element.getFloat("h", 0.0F)));
      paramEntity.addInfo(objectInfo);
      element = element.getChildByName("frames");
      if (element != null)
        for (XmlReader.Element element : element.getChildrenByName("i")) {
          int i = element.getInt("folder", 0);
          int j = element.getInt("file", 0);
          objectInfo.frames.add(new FileReference(i, j));
        }  
    } 
  }
  
  protected void loadRefs(ArrayList<XmlReader.Element> paramArrayList1, ArrayList<XmlReader.Element> paramArrayList2, Mainline.Key paramKey) {
    for (XmlReader.Element element : paramArrayList2)
      paramKey.addBoneRef(new Mainline.Key.BoneRef(element.getInt("id"), element.getInt("timeline"), element.getInt("key"), paramKey.getBoneRef(element.getInt("parent", -1)))); 
    for (XmlReader.Element element : paramArrayList1)
      paramKey.addObjectRef(new Mainline.Key.ObjectRef(element.getInt("id"), element.getInt("timeline"), element.getInt("key"), paramKey.getBoneRef(element.getInt("parent", -1)), element.getInt("z_index", 0))); 
    Arrays.sort(paramKey.objectRefs);
  }
  
  protected void loadTimelineKeys(ArrayList<XmlReader.Element> paramArrayList, Timeline paramTimeline) {
    for (byte b = 0; b < paramArrayList.size(); b++) {
      byte b1;
      float f2;
      XmlReader.Element element1 = (XmlReader.Element)paramArrayList.get(b);
      Curve curve;
      curve.setType((curve = new Curve()).getType(element1.get("curve_type", "linear")));
      curve.constraints.set(element1.getFloat("c1", 0.0F), element1.getFloat("c2", 0.0F), element1.getFloat("c3", 0.0F), element1.getFloat("c4", 0.0F));
      Timeline.Key key = new Timeline.Key(element1.getInt("id"), element1.getInt("time", 0), element1.getInt("spin", 1), curve);
      XmlReader.Element element2 = element1.getChildByName("bone");
      Timeline.Key.Object object = element2;
      if (element2 == null)
        object = element1.getChildByName("object"); 
      Point point1 = new Point(object.getFloat("x", 0.0F), object.getFloat("y", 0.0F));
      Point point3 = new Point(object.getFloat("scale_x", 1.0F), object.getFloat("scale_y", 1.0F));
      float f1 = object.getFloat("pivot_x", 0.0F);
      if (paramTimeline.objectInfo.type == Entity.ObjectType.Bone) {
        f2 = 0.5F;
      } else {
        f2 = 1.0F;
      } 
      Point point2 = new Point(f1, object.getFloat("pivot_y", f2));
      f1 = object.getFloat("angle", 0.0F);
      boolean bool = object.getName().equals("object");
      int i = -1;
      if (bool && paramTimeline.objectInfo.type == Entity.ObjectType.Sprite) {
        f2 = object.getFloat("a", 1.0F);
        b1 = object.getInt("folder", -1);
        i = object.getInt("file", -1);
        File file = this.data.getFolder(b1).getFile(i);
        point2 = new Point(object.getFloat("pivot_x", file.pivot.x), object.getFloat("pivot_y", file.pivot.y));
        paramTimeline.objectInfo.size.set(file.size);
      } else {
        b1 = -1;
        f2 = 1.0F;
      } 
      if (object.getName().equals("bone")) {
        Timeline.Key.Object object1 = new Timeline.Key.Object(point1, point3, point2, f1, f2, new FileReference(b1, i));
      } else {
        object = new Timeline.Key.Object(point1, point3, point2, f1, f2, new FileReference(b1, i));
      } 
      key.setObject(object);
      paramTimeline.addKey(key);
    } 
  }
  
  protected void loadTimelines(ArrayList<XmlReader.Element> paramArrayList, Animation paramAnimation, Entity paramEntity) {
    for (byte b = 0; b < paramArrayList.size(); b++) {
      XmlReader.Element element = (XmlReader.Element)paramArrayList.get(b);
      ArrayList arrayList = ((XmlReader.Element)paramArrayList.get(b)).getChildrenByName("key");
      String str = element.get("name");
      Entity.ObjectType objectType = Entity.ObjectType.getObjectInfoFor(element.get("object_type", "sprite"));
      Entity.ObjectInfo objectInfo1 = paramEntity.getInfo(str);
      Entity.ObjectInfo objectInfo2 = objectInfo1;
      if (objectInfo1 == null)
        objectInfo2 = new Entity.ObjectInfo(str, objectType, new Dimension(0.0F, 0.0F)); 
      Timeline timeline = new Timeline(element.getInt("id"), str, objectInfo2, arrayList.size());
      paramAnimation.addTimeline(timeline);
      loadTimelineKeys(arrayList, timeline);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/SCMLReader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */