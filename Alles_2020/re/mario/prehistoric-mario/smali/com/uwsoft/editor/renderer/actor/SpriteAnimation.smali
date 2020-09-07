.class public Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;
.super Lcom/badlogic/gdx/scenes/scene2d/Actor;
.source "SpriteAnimation.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/actor/IBaseItem;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;,
        Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$AnimationCompleteListener;
    }
.end annotation


# instance fields
.field private animationAtlasRegions:[Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

.field public animationCompleteListener:Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$AnimationCompleteListener;

.field private animations:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;",
            ">;"
        }
    .end annotation
.end field

.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private currentAnimationName:Ljava/lang/String;

.field private customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

.field public dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

.field private endFrame:I

.field private final essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field private firstFrame:I

.field private frameDuration:F

.field private frameHeight:I

.field private frameIndex:I

.field private frameWidth:I

.field private framesCount:I

.field private isLockedByLayer:Z

.field private lastFrame:F

.field protected layerIndex:I

.field public looping:Z

.field public mulX:F

.field public mulY:F

.field private normalSpeed:F

.field private parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

.field private paused:Z

.field private playingTo:I

.field protected reverse:Z


# direct methods
.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 4

    .line 59
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 27
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->mulX:F

    .line 28
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->mulY:F

    const/4 v1, 0x0

    .line 31
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->layerIndex:I

    .line 32
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->reverse:Z

    .line 33
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->isLockedByLayer:Z

    const/4 v2, 0x0

    .line 34
    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    const/4 v2, -0x1

    .line 44
    iput v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->playingTo:I

    .line 45
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->normalSpeed:F

    const/4 v2, 0x1

    .line 46
    iput-boolean v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->paused:Z

    .line 47
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animations:Ljava/util/Map;

    .line 49
    new-instance v3, Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-direct {v3}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;-><init>()V

    iput-object v3, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    const-string v3, ""

    .line 50
    iput-object v3, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->currentAnimationName:Ljava/lang/String;

    .line 60
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 61
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    .line 62
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->x:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setX(F)V

    .line 63
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->y:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setY(F)V

    .line 64
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->scaleX:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setScaleX(F)V

    .line 65
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->scaleY:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setScaleY(F)V

    .line 66
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->customVars:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 67
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->animations:Ljava/lang/String;

    invoke-static {p1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;->constructJsonObject(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animations:Ljava/util/Map;

    .line 68
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->rotation:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setRotation(F)V

    .line 70
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->zIndex:I

    if-gez p1, :cond_0

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iput v1, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->zIndex:I

    .line 72
    :cond_0
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->tint:[F

    if-nez p1, :cond_1

    .line 73
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {p1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    goto :goto_0

    .line 75
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->tint:[F

    aget p2, p2, v1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->tint:[F

    aget v0, v0, v2

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->tint:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->tint:[F

    const/4 v3, 0x3

    aget v2, v2, v3

    invoke-direct {p1, p2, v0, v1, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    .line 78
    :goto_0
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->initSpriteAnimation()V

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 55
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;-><init>(Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 56
    invoke-virtual {p0, p3}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    return-void
.end method

.method private getFrameNumberFromName(Ljava/lang/String;)I
    .locals 3

    const/4 v0, 0x0

    const-string v1, ""

    .line 360
    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 361
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 365
    :cond_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private initSpriteAnimation()V
    .locals 5

    const/4 v0, 0x0

    .line 86
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->lastFrame:F

    const/4 v1, -0x1

    .line 87
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    .line 88
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setOriginX(F)V

    .line 89
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setOriginY(F)V

    .line 91
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->animationName:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getSpriteAnimation(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;->getRegions()Lcom/badlogic/gdx/utils/Array;

    move-result-object v0

    .line 93
    iget v1, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    new-array v1, v1, [Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    iput-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animationAtlasRegions:[Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    const/4 v1, 0x0

    .line 95
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    iget v2, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->originalHeight:I

    iput v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameHeight:I

    .line 96
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    iget v2, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->originalWidth:I

    iput v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameWidth:I

    .line 98
    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameWidth:I

    int-to-float v2, v2

    invoke-virtual {p0, v2}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setWidth(F)V

    .line 99
    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameHeight:I

    int-to-float v2, v2

    invoke-virtual {p0, v2}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setHeight(F)V

    .line 101
    iget v2, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    iput v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->framesCount:I

    .line 102
    :goto_0
    iget v2, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v3, 0x1

    if-ge v1, v2, :cond_0

    .line 103
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->name:Ljava/lang/String;

    .line 105
    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animationAtlasRegions:[Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    invoke-direct {p0, v2}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->regNameToFrame(Ljava/lang/String;)I

    move-result v2

    sub-int/2addr v2, v3

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    aput-object v3, v4, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 108
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->fps:I

    invoke-virtual {p0, v0, v3}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setAnimation(IZ)V

    return-void
.end method

.method private regNameToFrame(Ljava/lang/String;)I
    .locals 3

    const-string v0, "[^0-9]+([0-9]+)$"

    .line 171
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 172
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 173
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x1

    .line 174
    invoke-virtual {v0, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    .line 175
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    return p1

    .line 177
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Frame name should be something like this \'*0001\', but not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public act(F)V
    .locals 4

    .line 284
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->paused:Z

    if-eqz v0, :cond_0

    return-void

    .line 286
    :cond_0
    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameDuration:F

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->normalSpeed:F

    div-float/2addr v1, v2

    .line 288
    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->lastFrame:F

    add-float/2addr v2, p1

    iput v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->lastFrame:F

    .line 289
    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->lastFrame:F

    cmpl-float v1, v2, v1

    if-lez v1, :cond_8

    const/4 v1, 0x1

    if-nez v0, :cond_2

    .line 291
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->reverse:Z

    if-eqz v0, :cond_1

    .line 292
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    goto :goto_0

    .line 294
    :cond_1
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    :cond_2
    :goto_0
    const/4 v0, 0x0

    .line 297
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->lastFrame:F

    .line 298
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->playingTo:I

    if-le v0, v2, :cond_3

    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->reverse:Z

    if-eqz v0, :cond_4

    :cond_3
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->playingTo:I

    if-ge v0, v2, :cond_7

    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->reverse:Z

    if-eqz v0, :cond_7

    .line 300
    :cond_4
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->looping:Z

    if-eqz v0, :cond_5

    .line 301
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->firstFrame:I

    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    goto :goto_1

    .line 302
    :cond_5
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animationCompleteListener:Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$AnimationCompleteListener;

    if-eqz v0, :cond_6

    .line 303
    invoke-interface {v0, p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$AnimationCompleteListener;->complete(Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;)V

    .line 304
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->paused:Z

    .line 305
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->endFrame:I

    if-le v0, v2, :cond_7

    iput v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    goto :goto_1

    .line 307
    :cond_6
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->paused:Z

    .line 308
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->endFrame:I

    if-le v0, v2, :cond_7

    iput v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    .line 311
    :cond_7
    :goto_1
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->looping:Z

    if-nez v0, :cond_8

    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->playingTo:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_8

    iget v3, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    if-ne v3, v0, :cond_8

    .line 312
    iput v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->playingTo:I

    .line 313
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->paused:Z

    .line 314
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animationCompleteListener:Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$AnimationCompleteListener;

    if-eqz v0, :cond_8

    .line 315
    invoke-interface {v0, p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$AnimationCompleteListener;->complete(Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;)V

    .line 320
    :cond_8
    invoke-super {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->act(F)V

    return-void
.end method

.method public applyResolution(FF)V
    .locals 0

    .line 257
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->mulX:F

    .line 258
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->mulY:F

    .line 259
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->x:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->mulX:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setX(F)V

    .line 260
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->y:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->mulY:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setY(F)V

    .line 261
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->updateDataVO()V

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 377
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    :cond_0
    const/4 v0, 0x0

    .line 378
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 13

    .line 121
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v0, v0, p2

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-interface {p1, v1, v1, v1, v0}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setColor(FFFF)V

    .line 122
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animationAtlasRegions:[Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    aget-object v3, v0, v1

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getX()F

    move-result v0

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animationAtlasRegions:[Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    aget-object v1, v1, v2

    iget v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->offsetX:F

    add-float v4, v0, v1

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getY()F

    move-result v0

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animationAtlasRegions:[Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    aget-object v1, v1, v2

    iget v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->offsetY:F

    add-float v5, v0, v1

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getOriginX()F

    move-result v6

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getOriginY()F

    move-result v7

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animationAtlasRegions:[Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->getRegionWidth()I

    move-result v0

    int-to-float v8, v0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animationAtlasRegions:[Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;->getRegionHeight()I

    move-result v0

    int-to-float v9, v0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getScaleX()F

    move-result v10

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getScaleY()F

    move-result v11

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getRotation()F

    move-result v12

    move-object v2, p1

    invoke-interface/range {v2 .. v12}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFFFFFFF)V

    .line 125
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V

    return-void
.end method

.method public getAnimations()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;",
            ">;"
        }
    .end annotation

    .line 398
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animations:Ljava/util/Map;

    return-object v0
.end method

.method public getAtlasRegionAt(I)Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animationAtlasRegions:[Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 369
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getCurrentAnimationName()Ljava/lang/String;
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->currentAnimationName:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrentFrameIndex()I
    .locals 1

    .line 386
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    return v0
.end method

.method public getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;
    .locals 1

    .line 394
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    return-object v0
.end method

.method public getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;
    .locals 1

    .line 192
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    return-object v0
.end method

.method public getFramesCount()I
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animationAtlasRegions:[Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    array-length v0, v0

    return v0
.end method

.method public getLayerIndex()I
    .locals 1

    .line 229
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->layerIndex:I

    return v0
.end method

.method public getParentItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 266
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object v0
.end method

.method public isComposite()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isLockedByLayer()Z
    .locals 1

    .line 197
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->isLockedByLayer:Z

    return v0
.end method

.method public pause()V
    .locals 1

    const/4 v0, 0x1

    .line 324
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->paused:Z

    return-void
.end method

.method public playTo(I)V
    .locals 3

    .line 338
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->framesCount:I

    const/4 v1, 0x1

    if-lt p1, v0, :cond_0

    add-int/lit8 p1, v0, -0x1

    :cond_0
    const/4 v0, 0x0

    if-gez p1, :cond_1

    const/4 p1, 0x0

    .line 340
    :cond_1
    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    if-ne v2, p1, :cond_2

    return-void

    :cond_2
    if-le v2, p1, :cond_3

    .line 342
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->reverse:Z

    goto :goto_0

    .line 344
    :cond_3
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->reverse:Z

    .line 346
    :goto_0
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->playingTo:I

    .line 347
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->paused:Z

    return-void
.end method

.method public renew()V
    .locals 5

    .line 212
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setX(F)V

    .line 213
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setY(F)V

    .line 214
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->scaleX:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setScaleX(F)V

    .line 215
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->scaleY:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setScaleY(F)V

    .line 216
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->rotation:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setRotation(F)V

    .line 217
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->tint:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->tint:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->tint:[F

    const/4 v3, 0x2

    aget v2, v2, v3

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->tint:[F

    const/4 v4, 0x3

    aget v3, v3, v4

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setColor(FFFF)V

    .line 218
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->currentAnimationName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 219
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->fps:I

    iget-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->looping:Z

    invoke-virtual {p0, v0, v1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setAnimation(IZ)V

    goto :goto_0

    .line 221
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->currentAnimationName:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setAnimation(Ljava/lang/String;)V

    .line 223
    :goto_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->customVars:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 224
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->animations:Ljava/lang/String;

    invoke-static {v0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;->constructJsonObject(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animations:Ljava/util/Map;

    return-void
.end method

.method public resume()V
    .locals 1

    const/4 v0, 0x0

    .line 333
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->paused:Z

    return-void
.end method

.method public setAnimation(IIIZ)V
    .locals 1

    .line 154
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->firstFrame:I

    .line 155
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->endFrame:I

    .line 156
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->endFrame:I

    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->playingTo:I

    .line 158
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    int-to-float p3, p3

    const/high16 v0, 0x3f800000    # 1.0f

    div-float/2addr v0, p3

    .line 160
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameDuration:F

    .line 161
    iput-boolean p4, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->looping:Z

    if-le p1, p2, :cond_0

    const/4 p1, 0x1

    .line 164
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->reverse:Z

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 166
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->reverse:Z

    :goto_0
    return-void
.end method

.method public setAnimation(IZ)V
    .locals 4

    const/4 v0, 0x0

    .line 141
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->firstFrame:I

    .line 142
    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->framesCount:I

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->endFrame:I

    .line 143
    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->endFrame:I

    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->playingTo:I

    .line 145
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    int-to-float p1, p1

    const/high16 v3, 0x3f800000    # 1.0f

    div-float/2addr v3, p1

    .line 147
    iput v3, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameDuration:F

    .line 148
    iput-boolean p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->looping:Z

    .line 150
    iget p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->firstFrame:I

    if-le p1, v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->reverse:Z

    return-void
.end method

.method public setAnimation(Ljava/lang/String;)V
    .locals 4

    .line 133
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animations:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;

    if-eqz v0, :cond_0

    .line 135
    iget v1, v0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;->startFrame:I

    iget v0, v0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;->endFrame:I

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->fps:I

    iget-boolean v3, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->looping:Z

    invoke-virtual {p0, v1, v0, v2, v3}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setAnimation(IIIZ)V

    .line 136
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->currentAnimationName:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public setAnimation(Z)V
    .locals 1

    const/16 v0, 0x18

    .line 116
    invoke-virtual {p0, v0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setAnimation(IZ)V

    return-void
.end method

.method public setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0

    .line 373
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-void
.end method

.method public setCompletionListener(Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$AnimationCompleteListener;)V
    .locals 0

    .line 390
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animationCompleteListener:Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$AnimationCompleteListener;

    return-void
.end method

.method public setCurrFrame(I)V
    .locals 1

    .line 351
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    const/4 p1, -0x1

    .line 352
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->playingTo:I

    .line 353
    iget p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->framesCount:I

    if-lt p1, v0, :cond_0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    .line 354
    :cond_0
    iget p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    if-gez p1, :cond_1

    const/4 p1, 0x0

    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    :cond_1
    return-void
.end method

.method public setLayerIndex(I)V
    .locals 0

    .line 234
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->layerIndex:I

    return-void
.end method

.method public setLockByLayer(Z)V
    .locals 0

    .line 202
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->isLockedByLayer:Z

    return-void
.end method

.method public setNormalSpeed(F)V
    .locals 0

    .line 382
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->normalSpeed:F

    return-void
.end method

.method public setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 271
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-void
.end method

.method public setScale(F)V
    .locals 1

    .line 276
    invoke-super {p0, p1, p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setScale(FF)V

    .line 277
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iput p1, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->scaleX:F

    .line 278
    iput p1, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->scaleY:F

    .line 279
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->renew()V

    return-void
.end method

.method public setTint(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 3

    const/4 v0, 0x4

    .line 181
    new-array v0, v0, [F

    .line 182
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 183
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 184
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 185
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 186
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v1

    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->tint:[F

    .line 187
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public start()V
    .locals 1

    const/4 v0, 0x0

    .line 328
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->frameIndex:I

    .line 329
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->paused:Z

    return-void
.end method

.method public updateDataVO()V
    .locals 3

    .line 239
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getX()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->mulX:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->x:F

    .line 240
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getY()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->mulY:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->y:F

    .line 241
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getRotation()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->rotation:F

    .line 243
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getZIndex()I

    move-result v0

    if-ltz v0, :cond_0

    .line 244
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->getZIndex()I

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->zIndex:I

    .line 247
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->layerName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->layerName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 248
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    const-string v1, "Default"

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->layerName:Ljava/lang/String;

    .line 251
    :cond_2
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-virtual {v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->saveAsString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->customVars:Ljava/lang/String;

    .line 252
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->animations:Ljava/util/Map;

    invoke-static {v1}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;->constructJsonString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->animations:Ljava/lang/String;

    return-void
.end method
