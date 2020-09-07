.class Lcom/badlogic/gdx/graphics/g3d/ModelCache$1;
.super Lcom/badlogic/gdx/utils/FlushablePool;
.source "ModelCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/ModelCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/utils/FlushablePool<",
        "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/graphics/g3d/ModelCache;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/graphics/g3d/ModelCache;)V
    .locals 0

    .line 166
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$1;->this$0:Lcom/badlogic/gdx/graphics/g3d/ModelCache;

    invoke-direct {p0}, Lcom/badlogic/gdx/utils/FlushablePool;-><init>()V

    return-void
.end method


# virtual methods
.method protected newObject()Lcom/badlogic/gdx/graphics/g3d/Renderable;
    .locals 1

    .line 169
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/Renderable;-><init>()V

    return-object v0
.end method

.method protected bridge synthetic newObject()Ljava/lang/Object;
    .locals 1

    .line 166
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/ModelCache$1;->newObject()Lcom/badlogic/gdx/graphics/g3d/Renderable;

    move-result-object v0

    return-object v0
.end method
