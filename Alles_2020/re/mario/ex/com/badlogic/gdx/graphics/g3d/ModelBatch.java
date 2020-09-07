package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.g3d.utils.DefaultRenderableSorter;
import com.badlogic.gdx.graphics.g3d.utils.DefaultShaderProvider;
import com.badlogic.gdx.graphics.g3d.utils.DefaultTextureBinder;
import com.badlogic.gdx.graphics.g3d.utils.RenderContext;
import com.badlogic.gdx.graphics.g3d.utils.RenderableSorter;
import com.badlogic.gdx.graphics.g3d.utils.ShaderProvider;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.FlushablePool;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.Iterator;

public class ModelBatch implements Disposable {
  protected Camera camera;
  
  protected final RenderContext context;
  
  private final boolean ownContext;
  
  protected final Array<Renderable> renderables = new Array();
  
  protected final RenderablePool renderablesPool = new RenderablePool();
  
  protected final ShaderProvider shaderProvider;
  
  protected final RenderableSorter sorter;
  
  public ModelBatch() { this(null, null, null); }
  
  public ModelBatch(FileHandle paramFileHandle1, FileHandle paramFileHandle2) { this(null, new DefaultShaderProvider(paramFileHandle1, paramFileHandle2), null); }
  
  public ModelBatch(RenderContext paramRenderContext) { this(paramRenderContext, null, null); }
  
  public ModelBatch(RenderContext paramRenderContext, RenderableSorter paramRenderableSorter) { this(paramRenderContext, null, paramRenderableSorter); }
  
  public ModelBatch(RenderContext paramRenderContext, ShaderProvider paramShaderProvider) { this(paramRenderContext, paramShaderProvider, null); }
  
  public ModelBatch(RenderContext paramRenderContext, ShaderProvider paramShaderProvider, RenderableSorter paramRenderableSorter) {
    DefaultRenderableSorter defaultRenderableSorter = paramRenderableSorter;
    if (paramRenderableSorter == null)
      defaultRenderableSorter = new DefaultRenderableSorter(); 
    this.sorter = defaultRenderableSorter;
    if (paramRenderContext == null) {
      bool = true;
    } else {
      bool = false;
    } 
    this.ownContext = bool;
    RenderContext renderContext = paramRenderContext;
    if (paramRenderContext == null)
      renderContext = new RenderContext(new DefaultTextureBinder(true, true)); 
    this.context = renderContext;
    DefaultShaderProvider defaultShaderProvider = paramShaderProvider;
    if (paramShaderProvider == null)
      defaultShaderProvider = new DefaultShaderProvider(); 
    this.shaderProvider = defaultShaderProvider;
  }
  
  public ModelBatch(RenderableSorter paramRenderableSorter) { this(null, null, paramRenderableSorter); }
  
  public ModelBatch(ShaderProvider paramShaderProvider) { this(null, paramShaderProvider, null); }
  
  public ModelBatch(ShaderProvider paramShaderProvider, RenderableSorter paramRenderableSorter) { this(null, paramShaderProvider, paramRenderableSorter); }
  
  public ModelBatch(String paramString1, String paramString2) { this(null, new DefaultShaderProvider(paramString1, paramString2), null); }
  
  public void begin(Camera paramCamera) {
    if (this.camera == null) {
      this.camera = paramCamera;
      if (this.ownContext)
        this.context.begin(); 
      return;
    } 
    throw new GdxRuntimeException("Call end() first.");
  }
  
  public void dispose() { this.shaderProvider.dispose(); }
  
  public void end() {
    flush();
    if (this.ownContext)
      this.context.end(); 
    this.camera = null;
  }
  
  public void flush() {
    this.sorter.sort(this.camera, this.renderables);
    Shader shader = null;
    byte b = 0;
    while (b < this.renderables.size) {
      Renderable renderable = (Renderable)this.renderables.get(b);
      Shader shader1 = shader;
      if (shader != renderable.shader) {
        if (shader != null)
          shader.end(); 
        shader1 = renderable.shader;
        shader1.begin(this.camera, this.context);
      } 
      shader1.render(renderable);
      b++;
      shader = shader1;
    } 
    if (shader != null)
      shader.end(); 
    this.renderablesPool.flush();
    this.renderables.clear();
  }
  
  public Camera getCamera() { return this.camera; }
  
  public RenderContext getRenderContext() { return this.context; }
  
  public RenderableSorter getRenderableSorter() { return this.sorter; }
  
  public ShaderProvider getShaderProvider() { return this.shaderProvider; }
  
  public boolean ownsRenderContext() { return this.ownContext; }
  
  public void render(Renderable paramRenderable) {
    paramRenderable.shader = this.shaderProvider.getShader(paramRenderable);
    this.renderables.add(paramRenderable);
  }
  
  public void render(RenderableProvider paramRenderableProvider) {
    int i = this.renderables.size;
    paramRenderableProvider.getRenderables(this.renderables, this.renderablesPool);
    while (i < this.renderables.size) {
      Renderable renderable = (Renderable)this.renderables.get(i);
      renderable.shader = this.shaderProvider.getShader(renderable);
      i++;
    } 
  }
  
  public void render(RenderableProvider paramRenderableProvider, Environment paramEnvironment) {
    int i = this.renderables.size;
    paramRenderableProvider.getRenderables(this.renderables, this.renderablesPool);
    while (i < this.renderables.size) {
      Renderable renderable = (Renderable)this.renderables.get(i);
      renderable.environment = paramEnvironment;
      renderable.shader = this.shaderProvider.getShader(renderable);
      i++;
    } 
  }
  
  public void render(RenderableProvider paramRenderableProvider, Environment paramEnvironment, Shader paramShader) {
    int i = this.renderables.size;
    paramRenderableProvider.getRenderables(this.renderables, this.renderablesPool);
    while (i < this.renderables.size) {
      Renderable renderable = (Renderable)this.renderables.get(i);
      renderable.environment = paramEnvironment;
      renderable.shader = paramShader;
      renderable.shader = this.shaderProvider.getShader(renderable);
      i++;
    } 
  }
  
  public void render(RenderableProvider paramRenderableProvider, Shader paramShader) {
    int i = this.renderables.size;
    paramRenderableProvider.getRenderables(this.renderables, this.renderablesPool);
    while (i < this.renderables.size) {
      Renderable renderable = (Renderable)this.renderables.get(i);
      renderable.shader = paramShader;
      renderable.shader = this.shaderProvider.getShader(renderable);
      i++;
    } 
  }
  
  public <T extends RenderableProvider> void render(Iterable<T> paramIterable) {
    Iterator iterator = paramIterable.iterator();
    while (iterator.hasNext())
      render((RenderableProvider)iterator.next()); 
  }
  
  public <T extends RenderableProvider> void render(Iterable<T> paramIterable, Environment paramEnvironment) {
    Iterator iterator = paramIterable.iterator();
    while (iterator.hasNext())
      render((RenderableProvider)iterator.next(), paramEnvironment); 
  }
  
  public <T extends RenderableProvider> void render(Iterable<T> paramIterable, Environment paramEnvironment, Shader paramShader) {
    Iterator iterator = paramIterable.iterator();
    while (iterator.hasNext())
      render((RenderableProvider)iterator.next(), paramEnvironment, paramShader); 
  }
  
  public <T extends RenderableProvider> void render(Iterable<T> paramIterable, Shader paramShader) {
    Iterator iterator = paramIterable.iterator();
    while (iterator.hasNext())
      render((RenderableProvider)iterator.next(), paramShader); 
  }
  
  public void setCamera(Camera paramCamera) {
    if (this.camera != null) {
      if (this.renderables.size > 0)
        flush(); 
      this.camera = paramCamera;
      return;
    } 
    throw new GdxRuntimeException("Call begin() first.");
  }
  
  protected static class RenderablePool extends FlushablePool<Renderable> {
    protected Renderable newObject() { return new Renderable(); }
    
    public Renderable obtain() {
      Renderable renderable = (Renderable)super.obtain();
      renderable.environment = null;
      renderable.material = null;
      renderable.meshPart.set("", null, 0, 0, 0);
      renderable.shader = null;
      renderable.userData = null;
      return renderable;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/g3d/ModelBatch.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */