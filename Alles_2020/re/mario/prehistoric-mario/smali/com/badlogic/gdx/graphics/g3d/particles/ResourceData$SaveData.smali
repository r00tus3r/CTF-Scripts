.class public Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;
.super Ljava/lang/Object;
.source "ResourceData.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Json$Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SaveData"
.end annotation


# instance fields
.field assets:Lcom/badlogic/gdx/utils/IntArray;

.field data:Lcom/badlogic/gdx/utils/ObjectMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/ObjectMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private loadIndex:I

.field protected resources:Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->data:Lcom/badlogic/gdx/utils/ObjectMap;

    .line 61
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->assets:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v0, 0x0

    .line 62
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->loadIndex:I

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V
    .locals 1

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->data:Lcom/badlogic/gdx/utils/ObjectMap;

    .line 67
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->assets:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v0, 0x0

    .line 68
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->loadIndex:I

    .line 69
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->resources:Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;

    return-void
.end method


# virtual methods
.method public load(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TK;"
        }
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->data:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public loadAsset()Lcom/badlogic/gdx/assets/AssetDescriptor;
    .locals 4

    .line 86
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->loadIndex:I

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->assets:Lcom/badlogic/gdx/utils/IntArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->resources:Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->sharedAssets:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->assets:Lcom/badlogic/gdx/utils/IntArray;

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->loadIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->loadIndex:I

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;

    .line 88
    new-instance v1, Lcom/badlogic/gdx/assets/AssetDescriptor;

    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->filename:Ljava/lang/String;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->type:Ljava/lang/Class;

    invoke-direct {v1, v2, v0}, Lcom/badlogic/gdx/assets/AssetDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    return-object v1
.end method

.method public read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 3

    .line 103
    const-class v0, Lcom/badlogic/gdx/utils/ObjectMap;

    const-string v1, "data"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/ObjectMap;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->data:Lcom/badlogic/gdx/utils/ObjectMap;

    .line 104
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->assets:Lcom/badlogic/gdx/utils/IntArray;

    const-class v1, [I

    const-string v2, "indices"

    invoke-virtual {p1, v2, v1, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [I

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/IntArray;->addAll([I)V

    return-void
.end method

.method public save(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->data:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/utils/ObjectMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public saveAsset(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TK;>;)V"
        }
    .end annotation

    .line 73
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->resources:Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->getAssetData(Ljava/lang/String;Ljava/lang/Class;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 75
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->resources:Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->sharedAssets:Lcom/badlogic/gdx/utils/Array;

    new-instance v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;

    invoke-direct {v1, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 76
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->resources:Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->sharedAssets:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    add-int/lit8 v0, p1, -0x1

    .line 78
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->assets:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    return-void
.end method

.method public write(Lcom/badlogic/gdx/utils/Json;)V
    .locals 3

    .line 97
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->data:Lcom/badlogic/gdx/utils/ObjectMap;

    const-class v1, Lcom/badlogic/gdx/utils/ObjectMap;

    const-string v2, "data"

    invoke-virtual {p1, v2, v0, v1}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    .line 98
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->assets:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->toArray()[I

    move-result-object v0

    const-class v1, [I

    const-string v2, "indices"

    invoke-virtual {p1, v2, v0, v1}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    return-void
.end method
