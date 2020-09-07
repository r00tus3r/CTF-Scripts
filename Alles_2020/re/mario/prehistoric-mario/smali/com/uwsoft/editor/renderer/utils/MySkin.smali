.class public Lcom/uwsoft/editor/renderer/utils/MySkin;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;
.source "MySkin.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/uwsoft/editor/renderer/utils/MySkin$TintedDrawable;
    }
.end annotation


# instance fields
.field atlas:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

.field public fontFiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field resources:Lcom/badlogic/gdx/utils/ObjectMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/ObjectMap<",
            "Ljava/lang/Class;",
            "Lcom/badlogic/gdx/utils/ObjectMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 48
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;-><init>()V

    .line 44
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->resources:Lcom/badlogic/gdx/utils/ObjectMap;

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->fontFiles:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/files/FileHandle;)V
    .locals 2

    .line 54
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;-><init>()V

    .line 44
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->resources:Lcom/badlogic/gdx/utils/ObjectMap;

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->fontFiles:Ljava/util/ArrayList;

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/badlogic/gdx/files/FileHandle;->nameWithoutExtension()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".atlas"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/files/FileHandle;->sibling(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v0

    .line 56
    invoke-virtual {v0}, Lcom/badlogic/gdx/files/FileHandle;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 57
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    invoke-direct {v1, v0}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;-><init>(Lcom/badlogic/gdx/files/FileHandle;)V

    iput-object v1, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->atlas:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    .line 58
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->atlas:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->addRegions(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;)V

    .line 61
    :cond_0
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->load(Lcom/badlogic/gdx/files/FileHandle;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;)V
    .locals 1

    .line 66
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;-><init>()V

    .line 44
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->resources:Lcom/badlogic/gdx/utils/ObjectMap;

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->fontFiles:Ljava/util/ArrayList;

    .line 67
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->atlas:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    .line 68
    invoke-virtual {p0, p2}, Lcom/uwsoft/editor/renderer/utils/MySkin;->addRegions(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;)V

    .line 69
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->load(Lcom/badlogic/gdx/files/FileHandle;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;)V
    .locals 1

    .line 74
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;-><init>()V

    .line 44
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->resources:Lcom/badlogic/gdx/utils/ObjectMap;

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->fontFiles:Ljava/util/ArrayList;

    .line 75
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->atlas:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    .line 76
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->addRegions(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;)V

    return-void
.end method

.method private static findMethod(Ljava/lang/Class;Ljava/lang/String;)Lcom/badlogic/gdx/utils/reflect/Method;
    .locals 4

    .line 501
    invoke-static {p0}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getMethods(Ljava/lang/Class;)[Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object p0

    .line 502
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 503
    aget-object v2, p0, v1

    .line 504
    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 98
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->add(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    return-void
.end method

.method public add(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V
    .locals 2

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    .line 104
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->resources:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/ObjectMap;

    if-nez v0, :cond_0

    .line 106
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    .line 107
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->resources:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v1, p3, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/utils/ObjectMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 103
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "resource cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 102
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addRegions(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;)V
    .locals 5

    .line 90
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;->getRegions()Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    .line 91
    iget v0, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 92
    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    .line 93
    iget-object v3, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->name:Ljava/lang/String;

    const-class v4, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {p0, v3, v2, v4}, Lcom/uwsoft/editor/renderer/utils/MySkin;->add(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public dispose()V
    .locals 4

    .line 391
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->atlas:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;->dispose()V

    .line 392
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->resources:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap;->values()Lcom/badlogic/gdx/utils/ObjectMap$Values;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Values;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/utils/ObjectMap;

    .line 393
    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/ObjectMap;->values()Lcom/badlogic/gdx/utils/ObjectMap$Values;

    move-result-object v1

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/ObjectMap$Values;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 394
    instance-of v3, v2, Lcom/badlogic/gdx/utils/Disposable;

    if-eqz v3, :cond_2

    check-cast v2, Lcom/badlogic/gdx/utils/Disposable;

    invoke-interface {v2}, Lcom/badlogic/gdx/utils/Disposable;->dispose()V

    goto :goto_0

    :cond_3
    return-void
.end method

.method public find(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    if-eqz p1, :cond_1

    .line 292
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->resources:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/ObjectMap;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const/4 v1, 0x1

    .line 294
    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/ObjectMap;->findKey(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    .line 291
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "style cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public get(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    const-string v0, "default"

    .line 120
    invoke-virtual {p0, v0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    if-eqz p1, :cond_7

    if-eqz p2, :cond_6

    .line 127
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-ne p2, v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getDrawable(Ljava/lang/String;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object p1

    return-object p1

    .line 128
    :cond_0
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    if-ne p2, v0, :cond_1

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object p1

    return-object p1

    .line 129
    :cond_1
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    if-ne p2, v0, :cond_2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getPatch(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    move-result-object p1

    return-object p1

    .line 130
    :cond_2
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    if-ne p2, v0, :cond_3

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getSprite(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/Sprite;

    move-result-object p1

    return-object p1

    .line 132
    :cond_3
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->resources:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/ObjectMap;

    const-string v1, " registered with name: "

    const-string v2, "No "

    if-eqz v0, :cond_5

    .line 134
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_4

    return-object v0

    .line 135
    :cond_4
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    :cond_5
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "type cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 124
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getAll(Ljava/lang/Class;)Lcom/badlogic/gdx/utils/ObjectMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lcom/badlogic/gdx/utils/ObjectMap<",
            "Ljava/lang/String;",
            "TT;>;"
        }
    .end annotation

    .line 155
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->resources:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/utils/ObjectMap;

    return-object p1
.end method

.method public getAtlas()Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;
    .locals 1

    .line 386
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->atlas:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    return-object v0
.end method

.method public getColor(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 159
    const-class v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/Color;

    return-object p1
.end method

.method public getDrawable(Ljava/lang/String;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    .locals 5

    .line 249
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->optional(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v0, :cond_0

    return-object v0

    .line 252
    :cond_0
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->optional(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v0, :cond_1

    return-object v0

    .line 257
    :cond_1
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v1

    .line 258
    instance-of v2, v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    if-eqz v2, :cond_4

    .line 259
    move-object v2, v1

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    .line 260
    iget-object v3, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->splits:[I

    if-eqz v3, :cond_2

    .line 261
    new-instance v2, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getPatch(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;-><init>(Lcom/badlogic/gdx/graphics/g2d/NinePatch;)V

    :goto_0
    move-object v0, v2

    goto :goto_1

    .line 262
    :cond_2
    iget-boolean v3, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->rotate:Z

    if-nez v3, :cond_3

    iget v3, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->packedWidth:I

    iget v4, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->originalWidth:I

    if-ne v3, v4, :cond_3

    iget v3, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->packedHeight:I

    iget v2, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->originalHeight:I

    if-eq v3, v2, :cond_4

    .line 263
    :cond_3
    new-instance v2, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getSprite(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/Sprite;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;-><init>(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V

    goto :goto_0

    :cond_4
    :goto_1
    if-nez v0, :cond_5

    .line 265
    new-instance v2, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;

    invoke-direct {v2, v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    :try_end_0
    .catch Lcom/badlogic/gdx/utils/GdxRuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    :catch_0
    :cond_5
    if-nez v0, :cond_8

    .line 271
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->optional(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    if-eqz v0, :cond_6

    .line 273
    new-instance v1, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;

    invoke-direct {v1, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;-><init>(Lcom/badlogic/gdx/graphics/g2d/NinePatch;)V

    goto :goto_2

    .line 275
    :cond_6
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->optional(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    if-eqz v0, :cond_7

    .line 277
    new-instance v1, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;

    invoke-direct {v1, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;-><init>(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V

    goto :goto_2

    .line 279
    :cond_7
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No Drawable, NinePatch, TextureRegion, Texture, or Sprite registered with name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8
    move-object v1, v0

    .line 284
    :goto_2
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-virtual {p0, p1, v1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->add(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    return-object v1
.end method

.method public getFont(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;
    .locals 1

    .line 163
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    return-object p1
.end method

.method protected getJsonLoader(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/utils/Json;
    .locals 3

    .line 401
    new-instance v0, Lcom/uwsoft/editor/renderer/utils/MySkin$1;

    invoke-direct {v0, p0}, Lcom/uwsoft/editor/renderer/utils/MySkin$1;-><init>(Lcom/uwsoft/editor/renderer/utils/MySkin;)V

    const/4 v1, 0x0

    .line 409
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Json;->setTypeName(Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 410
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Json;->setUsePrototypes(Z)V

    .line 412
    const-class v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;

    new-instance v2, Lcom/uwsoft/editor/renderer/utils/MySkin$2;

    invoke-direct {v2, p0, p0}, Lcom/uwsoft/editor/renderer/utils/MySkin$2;-><init>(Lcom/uwsoft/editor/renderer/utils/MySkin;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/Json;->setSerializer(Ljava/lang/Class;Lcom/badlogic/gdx/utils/Json$Serializer;)V

    .line 439
    const-class v1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    new-instance v2, Lcom/uwsoft/editor/renderer/utils/MySkin$3;

    invoke-direct {v2, p0, p1, p0}, Lcom/uwsoft/editor/renderer/utils/MySkin$3;-><init>(Lcom/uwsoft/editor/renderer/utils/MySkin;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/Json;->setSerializer(Ljava/lang/Class;Lcom/badlogic/gdx/utils/Json$Serializer;)V

    .line 476
    const-class p1, Lcom/badlogic/gdx/graphics/Color;

    new-instance v1, Lcom/uwsoft/editor/renderer/utils/MySkin$4;

    invoke-direct {v1, p0}, Lcom/uwsoft/editor/renderer/utils/MySkin$4;-><init>(Lcom/uwsoft/editor/renderer/utils/MySkin;)V

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Json;->setSerializer(Ljava/lang/Class;Lcom/badlogic/gdx/utils/Json$Serializer;)V

    .line 489
    const-class p1, Lcom/uwsoft/editor/renderer/utils/MySkin$TintedDrawable;

    new-instance v1, Lcom/uwsoft/editor/renderer/utils/MySkin$5;

    invoke-direct {v1, p0}, Lcom/uwsoft/editor/renderer/utils/MySkin$5;-><init>(Lcom/uwsoft/editor/renderer/utils/MySkin;)V

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Json;->setSerializer(Ljava/lang/Class;Lcom/badlogic/gdx/utils/Json$Serializer;)V

    return-object v0
.end method

.method public getPatch(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/NinePatch;
    .locals 12

    .line 203
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->optional(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    if-eqz v0, :cond_0

    return-object v0

    .line 207
    :cond_0
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v7

    .line 208
    instance-of v1, v7, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    if-eqz v1, :cond_1

    .line 209
    move-object v1, v7

    check-cast v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->splits:[I

    if-eqz v1, :cond_1

    .line 211
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    const/4 v8, 0x0

    aget v3, v1, v8

    const/4 v9, 0x1

    aget v4, v1, v9

    const/4 v10, 0x2

    aget v5, v1, v10

    const/4 v11, 0x3

    aget v6, v1, v11

    move-object v1, v0

    move-object v2, v7

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    .line 212
    move-object v1, v7

    check-cast v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->pads:[I

    if-eqz v1, :cond_1

    .line 213
    aget v2, v1, v8

    aget v3, v1, v9

    aget v4, v1, v10

    aget v1, v1, v11

    invoke-virtual {v0, v2, v3, v4, v1}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->setPadding(IIII)V

    :cond_1
    if-nez v0, :cond_2

    .line 216
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    invoke-direct {v0, v7}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 217
    :cond_2
    const-class v1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    invoke-virtual {p0, p1, v0, v1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->add(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V
    :try_end_0
    .catch Lcom/badlogic/gdx/utils/GdxRuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 220
    :catch_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No NinePatch, TextureRegion, or Texture registered with name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 3

    .line 169
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->optional(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    if-eqz v0, :cond_0

    return-object v0

    .line 172
    :cond_0
    const-class v0, Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->optional(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/Texture;

    if-eqz v0, :cond_1

    .line 174
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-direct {v1, v0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    .line 175
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {p0, p1, v1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->add(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    return-object v1

    .line 173
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No TextureRegion or Texture registered with name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSprite(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/Sprite;
    .locals 5

    .line 228
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->optional(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    if-eqz v0, :cond_0

    return-object v0

    .line 232
    :cond_0
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v1

    .line 233
    instance-of v2, v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    if-eqz v2, :cond_2

    .line 234
    move-object v2, v1

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    .line 235
    iget-boolean v3, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->rotate:Z

    if-nez v3, :cond_1

    iget v3, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->packedWidth:I

    iget v4, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->originalWidth:I

    if-ne v3, v4, :cond_1

    iget v3, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->packedHeight:I

    iget v4, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->originalHeight:I

    if-eq v3, v4, :cond_2

    .line 236
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasSprite;

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasSprite;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;)V

    :cond_2
    if-nez v0, :cond_3

    .line 238
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 239
    :cond_3
    const-class v1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    invoke-virtual {p0, p1, v0, v1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->add(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V
    :try_end_0
    .catch Lcom/badlogic/gdx/utils/GdxRuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 242
    :catch_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No NinePatch, TextureRegion, or Texture registered with name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTiledDrawable(Ljava/lang/String;)Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;
    .locals 4

    .line 182
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->optional(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;

    if-eqz v0, :cond_0

    return-object v0

    .line 185
    :cond_0
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->optional(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v0, :cond_2

    .line 187
    instance-of v1, v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;

    if-eqz v1, :cond_1

    .line 191
    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;

    return-object v0

    .line 188
    :cond_1
    new-instance v1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Drawable found but is not a TiledDrawable: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 194
    :cond_2
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 195
    const-class v1, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;

    invoke-virtual {p0, p1, v0, v1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->add(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    return-object v0
.end method

.method public has(Ljava/lang/String;Ljava/lang/Class;)Z
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->resources:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/utils/ObjectMap;

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return p1

    .line 150
    :cond_0
    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public load(Lcom/badlogic/gdx/files/FileHandle;)V
    .locals 4

    .line 82
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getJsonLoader(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/utils/Json;

    move-result-object v0

    const-class v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;

    invoke-virtual {v0, v1, p1}, Lcom/badlogic/gdx/utils/Json;->fromJson(Ljava/lang/Class;Lcom/badlogic/gdx/files/FileHandle;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/badlogic/gdx/utils/SerializationException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 84
    new-instance v1, Lcom/badlogic/gdx/utils/SerializationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error reading file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Lcom/badlogic/gdx/utils/SerializationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public newDrawable(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    .locals 3

    .line 314
    instance-of v0, p1, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;

    check-cast p1, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;)V

    return-object v0

    .line 315
    :cond_0
    instance-of v0, p1, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;

    if-eqz v0, :cond_1

    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;

    check-cast p1, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;)V

    return-object v0

    .line 316
    :cond_1
    instance-of v0, p1, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;

    if-eqz v0, :cond_2

    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;

    check-cast p1, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;)V

    return-object v0

    .line 317
    :cond_2
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to copy, unknown drawable type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public newDrawable(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;FFFF)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    .locals 1

    .line 322
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0, p2, p3, p4, p5}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->newDrawable(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object p1

    return-object p1
.end method

.method public newDrawable(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    .locals 2

    .line 327
    instance-of v0, p1, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;

    if-eqz v0, :cond_1

    .line 328
    check-cast p1, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->getRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object p1

    .line 330
    instance-of v0, p1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    if-eqz v0, :cond_0

    .line 331
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasSprite;

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasSprite;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;)V

    goto :goto_0

    .line 333
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 334
    :goto_0
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 335
    new-instance p1, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;-><init>(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V

    return-object p1

    .line 337
    :cond_1
    instance-of v0, p1, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;

    if-eqz v0, :cond_2

    .line 338
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;

    check-cast p1, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;)V

    .line 339
    new-instance p1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->getPatch()Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    move-result-object v1

    invoke-direct {p1, v1, p2}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;-><init>(Lcom/badlogic/gdx/graphics/g2d/NinePatch;Lcom/badlogic/gdx/graphics/Color;)V

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->setPatch(Lcom/badlogic/gdx/graphics/g2d/NinePatch;)V

    return-object v0

    .line 342
    :cond_2
    instance-of v0, p1, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;

    if-eqz v0, :cond_4

    .line 343
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;

    check-cast p1, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;)V

    .line 344
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;->getSprite()Lcom/badlogic/gdx/graphics/g2d/Sprite;

    move-result-object p1

    .line 345
    instance-of v1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasSprite;

    if-eqz v1, :cond_3

    .line 346
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasSprite;

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasSprite;

    invoke-direct {v1, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasSprite;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasSprite;)V

    goto :goto_1

    .line 348
    :cond_3
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    invoke-direct {v1, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;-><init>(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V

    .line 349
    :goto_1
    invoke-virtual {v1, p2}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 350
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;->setSprite(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V

    return-object v0

    .line 353
    :cond_4
    new-instance p2, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unable to copy, unknown drawable type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public newDrawable(Ljava/lang/String;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    .locals 0

    .line 299
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getDrawable(Ljava/lang/String;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->newDrawable(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object p1

    return-object p1
.end method

.method public newDrawable(Ljava/lang/String;FFFF)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    .locals 1

    .line 304
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getDrawable(Ljava/lang/String;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object p1

    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0, p2, p3, p4, p5}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->newDrawable(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object p1

    return-object p1
.end method

.method public newDrawable(Ljava/lang/String;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    .locals 0

    .line 309
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->getDrawable(Ljava/lang/String;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/uwsoft/editor/renderer/utils/MySkin;->newDrawable(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object p1

    return-object p1
.end method

.method public optional(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    .line 142
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->resources:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/utils/ObjectMap;

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 144
    :cond_0
    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 141
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "type cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 140
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public remove(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 114
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/MySkin;->resources:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/utils/ObjectMap;

    .line 115
    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 113
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "name cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setEnabled(Lcom/badlogic/gdx/scenes/scene2d/Actor;Z)V
    .locals 6

    .line 362
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getStyle"

    invoke-static {v0, v1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->findMethod(Ljava/lang/Class;Ljava/lang/String;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    .line 366
    :try_start_0
    new-array v2, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v2}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 371
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->find(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    return-void

    .line 373
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    const-string v5, "-disabled"

    invoke-virtual {v2, v5, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p2, :cond_2

    goto :goto_0

    :cond_2
    move-object v4, v5

    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 374
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, p2, v0}, Lcom/uwsoft/editor/renderer/utils/MySkin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    .line 376
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "setStyle"

    invoke-static {v0, v2}, Lcom/uwsoft/editor/renderer/utils/MySkin;->findMethod(Ljava/lang/Class;Ljava/lang/String;)Lcom/badlogic/gdx/utils/reflect/Method;

    move-result-object v0

    if-nez v0, :cond_3

    return-void

    :cond_3
    const/4 v2, 0x1

    .line 379
    :try_start_1
    new-array v2, v2, [Ljava/lang/Object;

    aput-object p2, v2, v1

    invoke-virtual {v0, p1, v2}, Lcom/badlogic/gdx/utils/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    return-void
.end method
