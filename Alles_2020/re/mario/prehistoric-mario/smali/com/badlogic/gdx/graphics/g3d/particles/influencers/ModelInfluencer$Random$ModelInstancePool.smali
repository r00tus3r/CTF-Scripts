.class Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ModelInfluencer$Random$ModelInstancePool;
.super Lcom/badlogic/gdx/utils/Pool;
.source "ModelInfluencer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ModelInfluencer$Random;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ModelInstancePool"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/utils/Pool<",
        "Lcom/badlogic/gdx/graphics/g3d/ModelInstance;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ModelInfluencer$Random;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ModelInfluencer$Random;)V
    .locals 0

    .line 66
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ModelInfluencer$Random$ModelInstancePool;->this$0:Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ModelInfluencer$Random;

    invoke-direct {p0}, Lcom/badlogic/gdx/utils/Pool;-><init>()V

    return-void
.end method


# virtual methods
.method public newObject()Lcom/badlogic/gdx/graphics/g3d/ModelInstance;
    .locals 2

    .line 71
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ModelInfluencer$Random$ModelInstancePool;->this$0:Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ModelInfluencer$Random;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ModelInfluencer$Random;->models:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->random()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/Model;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;)V

    return-object v0
.end method

.method public bridge synthetic newObject()Ljava/lang/Object;
    .locals 1

    .line 65
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/influencers/ModelInfluencer$Random$ModelInstancePool;->newObject()Lcom/badlogic/gdx/graphics/g3d/ModelInstance;

    move-result-object v0

    return-object v0
.end method
