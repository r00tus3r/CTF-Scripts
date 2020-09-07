.class public Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;
.super Ljava/lang/Object;
.source "ParticleEffect.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# instance fields
.field private bounds:Lcom/badlogic/gdx/math/collision/BoundingBox;

.field private final emitters:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;",
            ">;"
        }
    .end annotation
.end field

.field protected motionScale:F

.field private ownsTexture:Z

.field protected xSizeScale:F

.field protected ySizeScale:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 41
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->xSizeScale:F

    .line 42
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->ySizeScale:F

    .line 43
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->motionScale:F

    .line 46
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;)V
    .locals 4

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 41
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->xSizeScale:F

    .line 42
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->ySizeScale:F

    .line 43
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->motionScale:F

    .line 50
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(ZI)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    .line 51
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 52
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget-object v3, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->newEmitter(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;)Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public allowCompletion()V
    .locals 3

    .line 94
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 95
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->allowCompletion()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public dispose()V
    .locals 4

    .line 240
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->ownsTexture:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 241
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    :goto_0
    if-ge v0, v1, :cond_2

    .line 242
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    .line 243
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getSprites()Lcom/badlogic/gdx/utils/Array;

    move-result-object v2

    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    .line 244
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v3

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Texture;->dispose()V

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;)V
    .locals 3

    .line 84
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 85
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-virtual {v2, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 3

    .line 89
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 90
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-virtual {v2, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public findEmitter(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;
    .locals 4

    .line 136
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 137
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    .line 138
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public flipY()V
    .locals 3

    .line 126
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 127
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->flipY()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getBoundingBox()Lcom/badlogic/gdx/math/collision/BoundingBox;
    .locals 3

    .line 251
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->bounds:Lcom/badlogic/gdx/math/collision/BoundingBox;

    if-nez v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/math/collision/BoundingBox;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/collision/BoundingBox;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->bounds:Lcom/badlogic/gdx/math/collision/BoundingBox;

    .line 253
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->bounds:Lcom/badlogic/gdx/math/collision/BoundingBox;

    .line 254
    invoke-virtual {v0}, Lcom/badlogic/gdx/math/collision/BoundingBox;->inf()Lcom/badlogic/gdx/math/collision/BoundingBox;

    .line 255
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    .line 256
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getBoundingBox()Lcom/badlogic/gdx/math/collision/BoundingBox;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/math/collision/BoundingBox;->ext(Lcom/badlogic/gdx/math/collision/BoundingBox;)Lcom/badlogic/gdx/math/collision/BoundingBox;

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public getEmitters()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;",
            ">;"
        }
    .end annotation

    .line 131
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public isComplete()Z
    .locals 4

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 100
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    .line 101
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->isComplete()Z

    move-result v3

    if-nez v3, :cond_0

    return v1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public load(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/files/FileHandle;)V
    .locals 0

    .line 153
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->loadEmitters(Lcom/badlogic/gdx/files/FileHandle;)V

    .line 154
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->loadEmitterImages(Lcom/badlogic/gdx/files/FileHandle;)V

    return-void
.end method

.method public load(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;)V
    .locals 1

    const/4 v0, 0x0

    .line 158
    invoke-virtual {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->load(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;Ljava/lang/String;)V

    return-void
.end method

.method public load(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;Ljava/lang/String;)V
    .locals 0

    .line 162
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->loadEmitters(Lcom/badlogic/gdx/files/FileHandle;)V

    .line 163
    invoke-virtual {p0, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->loadEmitterImages(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;Ljava/lang/String;)V

    return-void
.end method

.method public loadEmitterImages(Lcom/badlogic/gdx/files/FileHandle;)V
    .locals 10

    const/4 v0, 0x1

    .line 207
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->ownsTexture:Z

    .line 208
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>(I)V

    .line 209
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_3

    .line 210
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    .line 211
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getImagePaths()Lcom/badlogic/gdx/utils/Array;

    move-result-object v4

    iget v4, v4, Lcom/badlogic/gdx/utils/Array;->size:I

    if-nez v4, :cond_0

    goto :goto_2

    .line 212
    :cond_0
    new-instance v4, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v4}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 213
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getImagePaths()Lcom/badlogic/gdx/utils/Array;

    move-result-object v5

    invoke-virtual {v5}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 214
    new-instance v7, Ljava/io/File;

    const/16 v8, 0x5c

    const/16 v9, 0x2f

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    .line 215
    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    if-nez v7, :cond_1

    .line 217
    new-instance v7, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    invoke-virtual {p1, v6}, Lcom/badlogic/gdx/files/FileHandle;->child(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->loadTexture(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/badlogic/gdx/graphics/g2d/Sprite;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    .line 218
    invoke-virtual {v0, v6, v7}, Lcom/badlogic/gdx/utils/ObjectMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    :cond_1
    invoke-virtual {v4, v7}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_1

    .line 222
    :cond_2
    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->setSprites(Lcom/badlogic/gdx/utils/Array;)V

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method public loadEmitterImages(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;)V
    .locals 1

    const/4 v0, 0x0

    .line 185
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->loadEmitterImages(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;Ljava/lang/String;)V

    return-void
.end method

.method public loadEmitterImages(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;Ljava/lang/String;)V
    .locals 10

    .line 189
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_5

    .line 190
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    .line 191
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getImagePaths()Lcom/badlogic/gdx/utils/Array;

    move-result-object v4

    iget v4, v4, Lcom/badlogic/gdx/utils/Array;->size:I

    if-nez v4, :cond_0

    goto :goto_2

    .line 192
    :cond_0
    new-instance v4, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v4}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 193
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getImagePaths()Lcom/badlogic/gdx/utils/Array;

    move-result-object v5

    invoke-virtual {v5}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 194
    new-instance v7, Ljava/io/File;

    const/16 v8, 0x5c

    const/16 v9, 0x2f

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x2e

    .line 195
    invoke-virtual {v6, v7}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_1

    .line 196
    invoke-virtual {v6, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    :cond_1
    if-eqz p2, :cond_2

    .line 197
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 198
    :cond_2
    invoke-virtual {p1, v6}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;->createSprite(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/Sprite;

    move-result-object v7

    if-eqz v7, :cond_3

    .line 200
    invoke-virtual {v4, v7}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_1

    .line 199
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "SpriteSheet missing image: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 202
    :cond_4
    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->setSprites(Lcom/badlogic/gdx/utils/Array;)V

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_5
    return-void
.end method

.method public loadEmitters(Lcom/badlogic/gdx/files/FileHandle;)V
    .locals 5

    .line 167
    invoke-virtual {p1}, Lcom/badlogic/gdx/files/FileHandle;->read()Ljava/io/InputStream;

    move-result-object v0

    .line 168
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    const/4 v1, 0x0

    .line 171
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v0, 0x200

    invoke-direct {v2, v3, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 173
    :cond_0
    :try_start_1
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->newEmitter(Ljava/io/BufferedReader;)Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    move-result-object v0

    .line 174
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 175
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_0

    .line 180
    invoke-static {v2}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-void

    :catchall_0
    move-exception p1

    move-object v1, v2

    goto :goto_1

    :catch_0
    move-exception v0

    move-object v1, v2

    goto :goto_0

    :catchall_1
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception v0

    .line 178
    :goto_0
    :try_start_2
    new-instance v2, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error loading effect: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 180
    :goto_1
    invoke-static {v1}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method protected loadTexture(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/graphics/Texture;
    .locals 2

    .line 235
    new-instance v0, Lcom/badlogic/gdx/graphics/Texture;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/badlogic/gdx/graphics/Texture;-><init>(Lcom/badlogic/gdx/files/FileHandle;Z)V

    return-object v0
.end method

.method protected newEmitter(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;)Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;
    .locals 1

    .line 231
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;-><init>(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;)V

    return-object v0
.end method

.method protected newEmitter(Ljava/io/BufferedReader;)Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 227
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;-><init>(Ljava/io/BufferedReader;)V

    return-object v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, 0x1

    .line 63
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->reset(Z)V

    return-void
.end method

.method public reset(Z)V
    .locals 3

    .line 70
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 71
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->reset()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_2

    .line 72
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->xSizeScale:F

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v0

    if-nez p1, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->ySizeScale:F

    cmpl-float p1, p1, v0

    if-nez p1, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->motionScale:F

    cmpl-float p1, p1, v0

    if-eqz p1, :cond_2

    .line 73
    :cond_1
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->xSizeScale:F

    div-float p1, v0, p1

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->ySizeScale:F

    div-float v1, v0, v1

    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->motionScale:F

    div-float v2, v0, v2

    invoke-virtual {p0, p1, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->scaleEffect(FFF)V

    .line 74
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->motionScale:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->ySizeScale:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->xSizeScale:F

    :cond_2
    return-void
.end method

.method public save(Ljava/io/Writer;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 146
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    add-int/lit8 v4, v2, 0x1

    if-lez v2, :cond_0

    const-string v2, "\n"

    .line 147
    invoke-virtual {p1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 148
    :cond_0
    invoke-virtual {v3, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->save(Ljava/io/Writer;)V

    add-int/lit8 v1, v1, 0x1

    move v2, v4

    goto :goto_0

    :cond_1
    return-void
.end method

.method public scaleEffect(F)V
    .locals 0

    .line 263
    invoke-virtual {p0, p1, p1, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->scaleEffect(FFF)V

    return-void
.end method

.method public scaleEffect(FF)V
    .locals 0

    .line 269
    invoke-virtual {p0, p1, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->scaleEffect(FFF)V

    return-void
.end method

.method public scaleEffect(FFF)V
    .locals 2

    .line 275
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->xSizeScale:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->xSizeScale:F

    .line 276
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->ySizeScale:F

    mul-float v0, v0, p2

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->ySizeScale:F

    .line 277
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->motionScale:F

    mul-float v0, v0, p3

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->motionScale:F

    .line 278
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    .line 279
    invoke-virtual {v1, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->scaleSize(FF)V

    .line 280
    invoke-virtual {v1, p3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->scaleMotion(F)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setDuration(I)V
    .locals 5

    .line 107
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 108
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    .line 109
    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->setContinuous(Z)V

    int-to-float v4, p1

    .line 110
    iput v4, v3, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    const/4 v4, 0x0

    .line 111
    iput v4, v3, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setEmittersCleanUpBlendFunction(Z)V
    .locals 3

    .line 291
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 292
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-virtual {v2, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->setCleansUpBlendFunction(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setFlip(ZZ)V
    .locals 3

    .line 121
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 122
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-virtual {v2, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->setFlip(ZZ)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setPosition(FF)V
    .locals 3

    .line 116
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 117
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-virtual {v2, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->setPosition(FF)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public start()V
    .locals 3

    .line 56
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 57
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->start()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public update(F)V
    .locals 3

    .line 79
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 80
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->emitters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;

    invoke-virtual {v2, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->update(F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
