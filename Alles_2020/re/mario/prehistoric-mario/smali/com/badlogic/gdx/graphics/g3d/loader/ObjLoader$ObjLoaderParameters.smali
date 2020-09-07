.class public Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$ObjLoaderParameters;
.super Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;
.source "ObjLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjLoaderParameters"
.end annotation


# instance fields
.field public flipV:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 72
    invoke-direct {p0}, Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;-><init>()V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 75
    invoke-direct {p0}, Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;-><init>()V

    .line 76
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/loader/ObjLoader$ObjLoaderParameters;->flipV:Z

    return-void
.end method
