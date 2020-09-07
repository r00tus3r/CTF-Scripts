.class public interface abstract Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;
.super Ljava/lang/Object;
.source "ModelCache.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/ModelCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MeshPool"
.end annotation


# virtual methods
.method public abstract flush()V
.end method

.method public abstract obtain(Lcom/badlogic/gdx/graphics/VertexAttributes;II)Lcom/badlogic/gdx/graphics/Mesh;
.end method
