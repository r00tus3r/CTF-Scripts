.class public interface abstract Lcom/badlogic/gdx/Graphics;
.super Ljava/lang/Object;
.source "Graphics.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/Graphics$BufferFormat;,
        Lcom/badlogic/gdx/Graphics$Monitor;,
        Lcom/badlogic/gdx/Graphics$DisplayMode;,
        Lcom/badlogic/gdx/Graphics$GraphicsType;
    }
.end annotation


# virtual methods
.method public abstract getBackBufferHeight()I
.end method

.method public abstract getBackBufferWidth()I
.end method

.method public abstract getBufferFormat()Lcom/badlogic/gdx/Graphics$BufferFormat;
.end method

.method public abstract getDeltaTime()F
.end method

.method public abstract getDensity()F
.end method

.method public abstract getDisplayMode()Lcom/badlogic/gdx/Graphics$DisplayMode;
.end method

.method public abstract getDisplayMode(Lcom/badlogic/gdx/Graphics$Monitor;)Lcom/badlogic/gdx/Graphics$DisplayMode;
.end method

.method public abstract getDisplayModes()[Lcom/badlogic/gdx/Graphics$DisplayMode;
.end method

.method public abstract getDisplayModes(Lcom/badlogic/gdx/Graphics$Monitor;)[Lcom/badlogic/gdx/Graphics$DisplayMode;
.end method

.method public abstract getFrameId()J
.end method

.method public abstract getFramesPerSecond()I
.end method

.method public abstract getGL20()Lcom/badlogic/gdx/graphics/GL20;
.end method

.method public abstract getGL30()Lcom/badlogic/gdx/graphics/GL30;
.end method

.method public abstract getGLVersion()Lcom/badlogic/gdx/graphics/glutils/GLVersion;
.end method

.method public abstract getHeight()I
.end method

.method public abstract getMonitor()Lcom/badlogic/gdx/Graphics$Monitor;
.end method

.method public abstract getMonitors()[Lcom/badlogic/gdx/Graphics$Monitor;
.end method

.method public abstract getPpcX()F
.end method

.method public abstract getPpcY()F
.end method

.method public abstract getPpiX()F
.end method

.method public abstract getPpiY()F
.end method

.method public abstract getPrimaryMonitor()Lcom/badlogic/gdx/Graphics$Monitor;
.end method

.method public abstract getRawDeltaTime()F
.end method

.method public abstract getType()Lcom/badlogic/gdx/Graphics$GraphicsType;
.end method

.method public abstract getWidth()I
.end method

.method public abstract isContinuousRendering()Z
.end method

.method public abstract isFullscreen()Z
.end method

.method public abstract isGL30Available()Z
.end method

.method public abstract newCursor(Lcom/badlogic/gdx/graphics/Pixmap;II)Lcom/badlogic/gdx/graphics/Cursor;
.end method

.method public abstract requestRendering()V
.end method

.method public abstract setContinuousRendering(Z)V
.end method

.method public abstract setCursor(Lcom/badlogic/gdx/graphics/Cursor;)V
.end method

.method public abstract setFullscreenMode(Lcom/badlogic/gdx/Graphics$DisplayMode;)Z
.end method

.method public abstract setGL20(Lcom/badlogic/gdx/graphics/GL20;)V
.end method

.method public abstract setGL30(Lcom/badlogic/gdx/graphics/GL30;)V
.end method

.method public abstract setResizable(Z)V
.end method

.method public abstract setSystemCursor(Lcom/badlogic/gdx/graphics/Cursor$SystemCursor;)V
.end method

.method public abstract setTitle(Ljava/lang/String;)V
.end method

.method public abstract setUndecorated(Z)V
.end method

.method public abstract setVSync(Z)V
.end method

.method public abstract setWindowedMode(II)Z
.end method

.method public abstract supportsDisplayModeChange()Z
.end method

.method public abstract supportsExtension(Ljava/lang/String;)Z
.end method
