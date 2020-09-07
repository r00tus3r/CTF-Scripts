package com.badlogic.gdx.assets;

import com.badlogic.gdx.assets.loaders.AssetLoader;
import com.badlogic.gdx.assets.loaders.AsynchronousAssetLoader;
import com.badlogic.gdx.assets.loaders.SynchronousAssetLoader;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.TimeUtils;
import com.badlogic.gdx.utils.async.AsyncExecutor;
import com.badlogic.gdx.utils.async.AsyncResult;
import com.badlogic.gdx.utils.async.AsyncTask;

class AssetLoadingTask extends Object implements AsyncTask<Void> {
  final AssetDescriptor assetDesc;
  
  final AsyncExecutor executor;
  
  final AssetLoader loader;
  
  AssetManager manager;
  
  final long startTime;
  
  int ticks = 0;
  
  public AssetLoadingTask(AssetManager paramAssetManager, AssetDescriptor paramAssetDescriptor, AssetLoader paramAssetLoader, AsyncExecutor paramAsyncExecutor) {
    this.manager = paramAssetManager;
    this.assetDesc = paramAssetDescriptor;
    this.loader = paramAssetLoader;
    this.executor = paramAsyncExecutor;
    if (paramAssetManager.log.getLevel() == 3) {
      l = TimeUtils.nanoTime();
    } else {
      l = 0L;
    } 
    this.startTime = l;
  }
  
  private void handleAsyncLoader() {
    stringBuilder = (AsynchronousAssetLoader)this.loader;
    if (!this.dependenciesLoaded) {
      if (this.depsFuture == null) {
        this.depsFuture = this.executor.submit(this);
      } else if (this.depsFuture.isDone()) {
        try {
          this.depsFuture.get();
          this.dependenciesLoaded = true;
          if (this.asyncDone)
            this.asset = stringBuilder.loadSync(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params); 
        } catch (Exception exception) {
          stringBuilder = new StringBuilder();
          stringBuilder.append("Couldn't load dependencies of asset: ");
          stringBuilder.append(this.assetDesc.fileName);
          throw new GdxRuntimeException(stringBuilder.toString(), exception);
        } 
      } 
    } else if (this.loadFuture == null && !this.asyncDone) {
      this.loadFuture = this.executor.submit(this);
    } else if (this.asyncDone) {
      this.asset = stringBuilder.loadSync(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
    } else if (this.loadFuture.isDone()) {
      try {
        this.loadFuture.get();
        this.asset = stringBuilder.loadSync(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
      } catch (Exception stringBuilder) {
        StringBuilder stringBuilder1 = new StringBuilder();
        stringBuilder1.append("Couldn't load asset: ");
        stringBuilder1.append(this.assetDesc.fileName);
        throw new GdxRuntimeException(stringBuilder1.toString(), stringBuilder);
      } 
    } 
  }
  
  private void handleSyncLoader() {
    SynchronousAssetLoader synchronousAssetLoader = (SynchronousAssetLoader)this.loader;
    if (!this.dependenciesLoaded) {
      this.dependenciesLoaded = true;
      this.dependencies = synchronousAssetLoader.getDependencies(this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
      if (this.dependencies == null) {
        this.asset = synchronousAssetLoader.load(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
        return;
      } 
      removeDuplicates(this.dependencies);
      this.manager.injectDependencies(this.assetDesc.fileName, this.dependencies);
    } else {
      this.asset = synchronousAssetLoader.load(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
    } 
  }
  
  private void removeDuplicates(Array<AssetDescriptor> paramArray) {
    boolean bool = paramArray.ordered;
    paramArray.ordered = true;
    for (byte b = 0; b < paramArray.size; b++) {
      String str = ((AssetDescriptor)paramArray.get(b)).fileName;
      Class clazz = ((AssetDescriptor)paramArray.get(b)).type;
      for (int i = paramArray.size - 1; i > b; i--) {
        if (clazz == ((AssetDescriptor)paramArray.get(i)).type && str.equals(((AssetDescriptor)paramArray.get(i)).fileName))
          paramArray.removeIndex(i); 
      } 
    } 
    paramArray.ordered = bool;
  }
  
  private FileHandle resolve(AssetLoader paramAssetLoader, AssetDescriptor paramAssetDescriptor) {
    if (paramAssetDescriptor.file == null)
      paramAssetDescriptor.file = paramAssetLoader.resolve(paramAssetDescriptor.fileName); 
    return paramAssetDescriptor.file;
  }
  
  public Void call() throws Exception {
    AsynchronousAssetLoader asynchronousAssetLoader = (AsynchronousAssetLoader)this.loader;
    if (!this.dependenciesLoaded) {
      this.dependencies = asynchronousAssetLoader.getDependencies(this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
      if (this.dependencies != null) {
        removeDuplicates(this.dependencies);
        this.manager.injectDependencies(this.assetDesc.fileName, this.dependencies);
      } else {
        asynchronousAssetLoader.loadAsync(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
        this.asyncDone = true;
      } 
    } else {
      asynchronousAssetLoader.loadAsync(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
    } 
    return null;
  }
  
  public Object getAsset() throws Exception { return this.asset; }
  
  public boolean update() {
    int i = this.ticks;
    boolean bool = true;
    this.ticks = i + 1;
    if (this.loader instanceof SynchronousAssetLoader) {
      handleSyncLoader();
    } else {
      handleAsyncLoader();
    } 
    if (this.asset == null)
      bool = false; 
    return bool;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/AssetLoadingTask.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */