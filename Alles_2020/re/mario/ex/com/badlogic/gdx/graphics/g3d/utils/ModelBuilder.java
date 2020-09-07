package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.Model;
import com.badlogic.gdx.graphics.g3d.model.MeshPart;
import com.badlogic.gdx.graphics.g3d.model.Node;
import com.badlogic.gdx.graphics.g3d.model.NodePart;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.Iterator;

public class ModelBuilder {
  private Array<MeshBuilder> builders = new Array();
  
  private Model model;
  
  private Node node;
  
  private Matrix4 tmpTransform = new Matrix4();
  
  private void endnode() {
    if (this.node != null)
      this.node = null; 
  }
  
  private MeshBuilder getBuilder(VertexAttributes paramVertexAttributes) {
    for (MeshBuilder meshBuilder1 : this.builders) {
      if (meshBuilder1.getAttributes().equals(paramVertexAttributes) && meshBuilder1.lastIndex() < 16383)
        return meshBuilder1; 
    } 
    MeshBuilder meshBuilder = new MeshBuilder();
    meshBuilder.begin(paramVertexAttributes);
    this.builders.add(meshBuilder);
    return meshBuilder;
  }
  
  public static void rebuildReferences(Model paramModel) {
    paramModel.materials.clear();
    paramModel.meshes.clear();
    paramModel.meshParts.clear();
    Iterator iterator = paramModel.nodes.iterator();
    while (iterator.hasNext())
      rebuildReferences(paramModel, (Node)iterator.next()); 
  }
  
  private static void rebuildReferences(Model paramModel, Node paramNode) {
    for (NodePart nodePart : paramNode.parts) {
      if (!paramModel.materials.contains(nodePart.material, true))
        paramModel.materials.add(nodePart.material); 
      if (!paramModel.meshParts.contains(nodePart.meshPart, true)) {
        paramModel.meshParts.add(nodePart.meshPart);
        if (!paramModel.meshes.contains(nodePart.meshPart.mesh, true))
          paramModel.meshes.add(nodePart.meshPart.mesh); 
        paramModel.manageDisposable(nodePart.meshPart.mesh);
      } 
    } 
    Iterator iterator = paramNode.getChildren().iterator();
    while (iterator.hasNext())
      rebuildReferences(paramModel, (Node)iterator.next()); 
  }
  
  public void begin() {
    if (this.model == null) {
      this.node = null;
      this.model = new Model();
      this.builders.clear();
      return;
    } 
    throw new GdxRuntimeException("Call end() first");
  }
  
  public Model createArrow(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, int paramInt1, int paramInt2, Material paramMaterial, long paramLong) {
    begin();
    part("arrow", paramInt2, paramLong, paramMaterial).arrow(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramInt1);
    return end();
  }
  
  public Model createArrow(Vector3 paramVector31, Vector3 paramVector32, Material paramMaterial, long paramLong) { return createArrow(paramVector31.x, paramVector31.y, paramVector31.z, paramVector32.x, paramVector32.y, paramVector32.z, 0.1F, 0.1F, 5, 4, paramMaterial, paramLong); }
  
  public Model createBox(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, Material paramMaterial, long paramLong) {
    begin();
    part("box", paramInt, paramLong, paramMaterial).box(paramFloat1, paramFloat2, paramFloat3);
    return end();
  }
  
  public Model createBox(float paramFloat1, float paramFloat2, float paramFloat3, Material paramMaterial, long paramLong) { return createBox(paramFloat1, paramFloat2, paramFloat3, 4, paramMaterial, paramLong); }
  
  public Model createCapsule(float paramFloat1, float paramFloat2, int paramInt1, int paramInt2, Material paramMaterial, long paramLong) {
    begin();
    part("capsule", paramInt2, paramLong, paramMaterial).capsule(paramFloat1, paramFloat2, paramInt1);
    return end();
  }
  
  public Model createCapsule(float paramFloat1, float paramFloat2, int paramInt, Material paramMaterial, long paramLong) { return createCapsule(paramFloat1, paramFloat2, paramInt, 4, paramMaterial, paramLong); }
  
  public Model createCone(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, Material paramMaterial, long paramLong) { return createCone(paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2, paramMaterial, paramLong, 0.0F, 360.0F); }
  
  public Model createCone(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, Material paramMaterial, long paramLong, float paramFloat4, float paramFloat5) {
    begin();
    part("cone", paramInt2, paramLong, paramMaterial).cone(paramFloat1, paramFloat2, paramFloat3, paramInt1, paramFloat4, paramFloat5);
    return end();
  }
  
  public Model createCone(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, Material paramMaterial, long paramLong) { return createCone(paramFloat1, paramFloat2, paramFloat3, paramInt, 4, paramMaterial, paramLong); }
  
  public Model createCone(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, Material paramMaterial, long paramLong, float paramFloat4, float paramFloat5) { return createCone(paramFloat1, paramFloat2, paramFloat3, paramInt, 4, paramMaterial, paramLong, paramFloat4, paramFloat5); }
  
  public Model createCylinder(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, Material paramMaterial, long paramLong) { return createCylinder(paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2, paramMaterial, paramLong, 0.0F, 360.0F); }
  
  public Model createCylinder(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, Material paramMaterial, long paramLong, float paramFloat4, float paramFloat5) {
    begin();
    part("cylinder", paramInt2, paramLong, paramMaterial).cylinder(paramFloat1, paramFloat2, paramFloat3, paramInt1, paramFloat4, paramFloat5);
    return end();
  }
  
  public Model createCylinder(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, Material paramMaterial, long paramLong) { return createCylinder(paramFloat1, paramFloat2, paramFloat3, paramInt, 4, paramMaterial, paramLong); }
  
  public Model createCylinder(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt, Material paramMaterial, long paramLong, float paramFloat4, float paramFloat5) { return createCylinder(paramFloat1, paramFloat2, paramFloat3, paramInt, 4, paramMaterial, paramLong, paramFloat4, paramFloat5); }
  
  public Model createLineGrid(int paramInt1, int paramInt2, float paramFloat1, float paramFloat2, Material paramMaterial, long paramLong) {
    begin();
    MeshPartBuilder meshPartBuilder = part("lines", 1, paramLong, paramMaterial);
    float f1 = paramInt1;
    float f2 = paramInt2;
    float f3 = f1 * paramFloat1 / 2.0F;
    float f4 = f2 * paramFloat2 / 2.0F;
    float f5 = -f3;
    f1 = -f4;
    int i = 0;
    f2 = f5;
    float f6 = f2;
    for (byte b = 0; b <= paramInt1; b++) {
      meshPartBuilder.line(f2, 0.0F, f4, f6, 0.0F, f1);
      f2 += paramFloat1;
      f6 += paramFloat1;
    } 
    paramFloat1 = f1;
    for (paramInt1 = i; paramInt1 <= paramInt2; paramInt1++) {
      meshPartBuilder.line(f5, 0.0F, f1, f3, 0.0F, paramFloat1);
      f1 += paramFloat2;
      paramFloat1 += paramFloat2;
    } 
    return end();
  }
  
  public Model createRect(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15, int paramInt, Material paramMaterial, long paramLong) {
    begin();
    part("rect", paramInt, paramLong, paramMaterial).rect(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, paramFloat11, paramFloat12, paramFloat13, paramFloat14, paramFloat15);
    return end();
  }
  
  public Model createRect(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13, float paramFloat14, float paramFloat15, Material paramMaterial, long paramLong) { return createRect(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, paramFloat10, paramFloat11, paramFloat12, paramFloat13, paramFloat14, paramFloat15, 4, paramMaterial, paramLong); }
  
  public Model createSphere(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, int paramInt3, Material paramMaterial, long paramLong) { return createSphere(paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2, paramInt3, paramMaterial, paramLong, 0.0F, 360.0F, 0.0F, 180.0F); }
  
  public Model createSphere(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, int paramInt3, Material paramMaterial, long paramLong, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7) {
    begin();
    part("cylinder", paramInt3, paramLong, paramMaterial).sphere(paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2, paramFloat4, paramFloat5, paramFloat6, paramFloat7);
    return end();
  }
  
  public Model createSphere(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, Material paramMaterial, long paramLong) { return createSphere(paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2, 4, paramMaterial, paramLong); }
  
  public Model createSphere(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, Material paramMaterial, long paramLong, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7) { return createSphere(paramFloat1, paramFloat2, paramFloat3, paramInt1, paramInt2, 4, paramMaterial, paramLong, paramFloat4, paramFloat5, paramFloat6, paramFloat7); }
  
  public Model createXYZCoordinates(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt1, int paramInt2, Material paramMaterial, long paramLong) {
    begin();
    node();
    MeshPartBuilder meshPartBuilder = part("xyz", paramInt2, paramLong, paramMaterial);
    meshPartBuilder.setColor(Color.RED);
    meshPartBuilder.arrow(0.0F, 0.0F, 0.0F, paramFloat1, 0.0F, 0.0F, paramFloat2, paramFloat3, paramInt1);
    meshPartBuilder.setColor(Color.GREEN);
    meshPartBuilder.arrow(0.0F, 0.0F, 0.0F, 0.0F, paramFloat1, 0.0F, paramFloat2, paramFloat3, paramInt1);
    meshPartBuilder.setColor(Color.BLUE);
    meshPartBuilder.arrow(0.0F, 0.0F, 0.0F, 0.0F, 0.0F, paramFloat1, paramFloat2, paramFloat3, paramInt1);
    return end();
  }
  
  public Model createXYZCoordinates(float paramFloat, Material paramMaterial, long paramLong) { return createXYZCoordinates(paramFloat, 0.1F, 0.1F, 5, 4, paramMaterial, paramLong); }
  
  public Model end() {
    Model model1 = this.model;
    if (model1 != null) {
      endnode();
      this.model = null;
      Iterator iterator = this.builders.iterator();
      while (iterator.hasNext())
        ((MeshBuilder)iterator.next()).end(); 
      this.builders.clear();
      rebuildReferences(model1);
      return model1;
    } 
    GdxRuntimeException gdxRuntimeException = new GdxRuntimeException("Call begin() first");
    throw gdxRuntimeException;
  }
  
  public void manage(Disposable paramDisposable) {
    Model model1 = this.model;
    if (model1 != null) {
      model1.manageDisposable(paramDisposable);
      return;
    } 
    throw new GdxRuntimeException("Call begin() first");
  }
  
  public Node node() {
    Node node1 = new Node();
    node(node1);
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("node");
    stringBuilder.append(this.model.nodes.size);
    node1.id = stringBuilder.toString();
    return node1;
  }
  
  protected Node node(Node paramNode) {
    if (this.model != null) {
      endnode();
      this.model.nodes.add(paramNode);
      this.node = paramNode;
      return paramNode;
    } 
    throw new GdxRuntimeException("Call begin() first");
  }
  
  public Node node(String paramString, Model paramModel) {
    Node node1 = new Node();
    node1.id = paramString;
    node1.addChildren(paramModel.nodes);
    node(node1);
    Iterator iterator = paramModel.getManagedDisposables().iterator();
    while (iterator.hasNext())
      manage((Disposable)iterator.next()); 
    return node1;
  }
  
  public MeshPart part(String paramString, Mesh paramMesh, int paramInt1, int paramInt2, int paramInt3, Material paramMaterial) {
    MeshPart meshPart = new MeshPart();
    meshPart.id = paramString;
    meshPart.primitiveType = paramInt1;
    meshPart.mesh = paramMesh;
    meshPart.offset = paramInt2;
    meshPart.size = paramInt3;
    part(meshPart, paramMaterial);
    return meshPart;
  }
  
  public MeshPart part(String paramString, Mesh paramMesh, int paramInt, Material paramMaterial) { return part(paramString, paramMesh, paramInt, 0, paramMesh.getNumIndices(), paramMaterial); }
  
  public MeshPartBuilder part(String paramString, int paramInt, long paramLong, Material paramMaterial) { return part(paramString, paramInt, MeshBuilder.createAttributes(paramLong), paramMaterial); }
  
  public MeshPartBuilder part(String paramString, int paramInt, VertexAttributes paramVertexAttributes, Material paramMaterial) {
    MeshBuilder meshBuilder = getBuilder(paramVertexAttributes);
    part(meshBuilder.part(paramString, paramInt), paramMaterial);
    return meshBuilder;
  }
  
  public void part(MeshPart paramMeshPart, Material paramMaterial) {
    if (this.node == null)
      node(); 
    this.node.parts.add(new NodePart(paramMeshPart, paramMaterial));
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/utils/ModelBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */