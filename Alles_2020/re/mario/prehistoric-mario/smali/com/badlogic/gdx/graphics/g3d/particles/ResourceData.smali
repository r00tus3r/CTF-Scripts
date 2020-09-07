.class public Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;
.super Ljava/lang/Object;
.source "ResourceData.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Json$Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;,
        Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;,
        Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$Configurable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/badlogic/gdx/utils/Json$Serializable;"
    }
.end annotation


# instance fields
.field private currentLoadIndex:I

.field private data:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;",
            ">;"
        }
    .end annotation
.end field

.field public resource:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field sharedAssets:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;",
            ">;"
        }
    .end annotation
.end field

.field private uniqueData:Lcom/badlogic/gdx/utils/ObjectMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/ObjectMap<",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 152
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->uniqueData:Lcom/badlogic/gdx/utils/ObjectMap;

    .line 153
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const-class v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;

    const/4 v2, 0x1

    const/4 v3, 0x3

    invoke-direct {v0, v2, v3, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(ZILjava/lang/Class;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->data:Lcom/badlogic/gdx/utils/Array;

    .line 154
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->sharedAssets:Lcom/badlogic/gdx/utils/Array;

    const/4 v0, 0x0

    .line 155
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->currentLoadIndex:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 159
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;-><init>()V

    .line 160
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->resource:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public createSaveData()Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;
    .locals 2

    .line 188
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V

    .line 189
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->data:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object v0
.end method

.method public createSaveData(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;
    .locals 2

    .line 195
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V

    .line 196
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->uniqueData:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 197
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->uniqueData:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v1, p1, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    .line 196
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Key already used, data must be unique, use a different key"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method getAssetData(Ljava/lang/String;Ljava/lang/Class;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TK;>;)I"
        }
    .end annotation

    .line 165
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->sharedAssets:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;

    .line 166
    iget-object v3, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->filename:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->type:Ljava/lang/Class;

    invoke-virtual {v2, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public getAssetDescriptors()Lcom/badlogic/gdx/utils/Array;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation

    .line 175
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 176
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->sharedAssets:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;

    .line 177
    new-instance v3, Lcom/badlogic/gdx/assets/AssetDescriptor;

    iget-object v4, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->filename:Ljava/lang/String;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;->type:Ljava/lang/Class;

    invoke-direct {v3, v4, v2}, Lcom/badlogic/gdx/assets/AssetDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getAssets()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;",
            ">;"
        }
    .end annotation

    .line 183
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->sharedAssets:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public getSaveData()Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;
    .locals 3

    .line 203
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->data:Lcom/badlogic/gdx/utils/Array;

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->currentLoadIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->currentLoadIndex:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;

    return-object v0
.end method

.method public getSaveData(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;
    .locals 1

    .line 208
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->uniqueData:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;

    return-object p1
.end method

.method public read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 4

    .line 221
    const-class v0, Lcom/badlogic/gdx/utils/ObjectMap;

    const-string v1, "unique"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/ObjectMap;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->uniqueData:Lcom/badlogic/gdx/utils/ObjectMap;

    .line 222
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->uniqueData:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap;->entries()Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->iterator()Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    .line 223
    iget-object v1, v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->value:Ljava/lang/Object;

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;

    iput-object p0, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->resources:Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;

    goto :goto_0

    .line 226
    :cond_0
    const-class v0, Lcom/badlogic/gdx/utils/Array;

    const-class v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;

    const-string v2, "data"

    invoke-virtual {p1, v2, v0, v1, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/Array;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->data:Lcom/badlogic/gdx/utils/Array;

    .line 227
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->data:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;

    .line 228
    iput-object p0, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->resources:Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;

    goto :goto_1

    .line 231
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->sharedAssets:Lcom/badlogic/gdx/utils/Array;

    const-class v1, Lcom/badlogic/gdx/utils/Array;

    const-class v2, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;

    const-string v3, "assets"

    invoke-virtual {p1, v3, v1, v2, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->addAll(Lcom/badlogic/gdx/utils/Array;)V

    const/4 v0, 0x0

    const-string v1, "resource"

    .line 232
    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->resource:Ljava/lang/Object;

    return-void
.end method

.method public write(Lcom/badlogic/gdx/utils/Json;)V
    .locals 4

    .line 213
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->uniqueData:Lcom/badlogic/gdx/utils/ObjectMap;

    const-class v1, Lcom/badlogic/gdx/utils/ObjectMap;

    const-string v2, "unique"

    invoke-virtual {p1, v2, v0, v1}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    .line 214
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->data:Lcom/badlogic/gdx/utils/Array;

    const-class v1, Lcom/badlogic/gdx/utils/Array;

    const-class v2, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;

    const-string v3, "data"

    invoke-virtual {p1, v3, v0, v1, v2}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)V

    .line 215
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->sharedAssets:Lcom/badlogic/gdx/utils/Array;

    const-class v1, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->toArray(Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    const-class v1, [Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$AssetData;

    const-string v2, "assets"

    invoke-virtual {p1, v2, v0, v1}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    .line 216
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->resource:Ljava/lang/Object;

    const-string v1, "resource"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v0, v2}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    return-void
.end method
