.class public Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;
.super Ljava/lang/Object;
.source "AnimatedTiledMapTile.java"

# interfaces
.implements Lcom/badlogic/gdx/maps/tiled/TiledMapTile;


# static fields
.field private static final initialTimeOffset:J

.field private static lastTiledMapRenderTime:J


# instance fields
.field private animationIntervals:[I

.field private blendMode:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

.field private frameCount:I

.field private frameTiles:[Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;

.field private id:I

.field private loopDuration:I

.field private objects:Lcom/badlogic/gdx/maps/MapObjects;

.field private properties:Lcom/badlogic/gdx/maps/MapProperties;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 46
    invoke-static {}, Lcom/badlogic/gdx/utils/TimeUtils;->millis()J

    move-result-wide v0

    sput-wide v0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->initialTimeOffset:J

    return-void
.end method

.method public constructor <init>(FLcom/badlogic/gdx/utils/Array;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;",
            ">;)V"
        }
    .end annotation

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    sget-object v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;->ALPHA:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->blendMode:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    const/4 v0, 0x0

    .line 44
    iput v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->frameCount:I

    .line 161
    iget v1, p2, Lcom/badlogic/gdx/utils/Array;->size:I

    new-array v1, v1, [Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;

    iput-object v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->frameTiles:[Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;

    .line 162
    iget v1, p2, Lcom/badlogic/gdx/utils/Array;->size:I

    iput v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->frameCount:I

    .line 164
    iget v1, p2, Lcom/badlogic/gdx/utils/Array;->size:I

    const/high16 v2, 0x447a0000    # 1000.0f

    mul-float p1, p1, v2

    float-to-int p1, p1

    mul-int v1, v1, p1

    iput v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->loopDuration:I

    .line 165
    iget v1, p2, Lcom/badlogic/gdx/utils/Array;->size:I

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->animationIntervals:[I

    .line 166
    :goto_0
    iget v1, p2, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, v1, :cond_0

    .line 167
    iget-object v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->frameTiles:[Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;

    aput-object v2, v1, v0

    .line 168
    iget-object v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->animationIntervals:[I

    aput p1, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/utils/IntArray;Lcom/badlogic/gdx/utils/Array;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/IntArray;",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;",
            ">;)V"
        }
    .end annotation

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    sget-object v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;->ALPHA:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->blendMode:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    const/4 v0, 0x0

    .line 44
    iput v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->frameCount:I

    .line 177
    iget v1, p2, Lcom/badlogic/gdx/utils/Array;->size:I

    new-array v1, v1, [Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;

    iput-object v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->frameTiles:[Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;

    .line 178
    iget v1, p2, Lcom/badlogic/gdx/utils/Array;->size:I

    iput v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->frameCount:I

    .line 180
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/IntArray;->toArray()[I

    move-result-object v1

    iput-object v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->animationIntervals:[I

    .line 181
    iput v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->loopDuration:I

    .line 183
    :goto_0
    iget v1, p1, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-ge v0, v1, :cond_0

    .line 184
    iget-object v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->frameTiles:[Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;

    aput-object v2, v1, v0

    .line 185
    iget v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->loopDuration:I

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->loopDuration:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static updateAnimationBaseTime()V
    .locals 4

    .line 153
    invoke-static {}, Lcom/badlogic/gdx/utils/TimeUtils;->millis()J

    move-result-wide v0

    sget-wide v2, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->initialTimeOffset:J

    sub-long/2addr v0, v2

    sput-wide v0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->lastTiledMapRenderTime:J

    return-void
.end method


# virtual methods
.method public getAnimationIntervals()[I
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->animationIntervals:[I

    return-object v0
.end method

.method public getBlendMode()Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->blendMode:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    return-object v0
.end method

.method public getCurrentFrame()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;
    .locals 2

    .line 82
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->frameTiles:[Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;

    invoke-virtual {p0}, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->getCurrentFrameIndex()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getCurrentFrameIndex()I
    .locals 4

    .line 69
    sget-wide v0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->lastTiledMapRenderTime:J

    iget v2, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->loopDuration:I

    int-to-long v2, v2

    rem-long/2addr v0, v2

    long-to-int v1, v0

    const/4 v0, 0x0

    .line 71
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->animationIntervals:[I

    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 72
    aget v2, v2, v0

    if-gt v1, v2, :cond_0

    return v0

    :cond_0
    sub-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 77
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Could not determine current animation frame in AnimatedTiledMapTile.  This should never happen."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public getFrameTiles()[Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;
    .locals 1

    .line 190
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->frameTiles:[Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .line 50
    iget v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->id:I

    return v0
.end method

.method public getObjects()Lcom/badlogic/gdx/maps/MapObjects;
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->objects:Lcom/badlogic/gdx/maps/MapObjects;

    if-nez v0, :cond_0

    .line 145
    new-instance v0, Lcom/badlogic/gdx/maps/MapObjects;

    invoke-direct {v0}, Lcom/badlogic/gdx/maps/MapObjects;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->objects:Lcom/badlogic/gdx/maps/MapObjects;

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->objects:Lcom/badlogic/gdx/maps/MapObjects;

    return-object v0
.end method

.method public getOffsetX()F
    .locals 1

    .line 97
    invoke-virtual {p0}, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->getCurrentFrame()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v0

    invoke-interface {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getOffsetX()F

    move-result v0

    return v0
.end method

.method public getOffsetY()F
    .locals 1

    .line 107
    invoke-virtual {p0}, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->getCurrentFrame()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v0

    invoke-interface {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getOffsetY()F

    move-result v0

    return v0
.end method

.method public getProperties()Lcom/badlogic/gdx/maps/MapProperties;
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->properties:Lcom/badlogic/gdx/maps/MapProperties;

    if-nez v0, :cond_0

    .line 137
    new-instance v0, Lcom/badlogic/gdx/maps/MapProperties;

    invoke-direct {v0}, Lcom/badlogic/gdx/maps/MapProperties;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->properties:Lcom/badlogic/gdx/maps/MapProperties;

    .line 139
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->properties:Lcom/badlogic/gdx/maps/MapProperties;

    return-object v0
.end method

.method public getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 1

    .line 87
    invoke-virtual {p0}, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->getCurrentFrame()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v0

    invoke-interface {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v0

    return-object v0
.end method

.method public setAnimationIntervals([I)V
    .locals 3

    .line 120
    array-length v0, p1

    iget-object v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->animationIntervals:[I

    array-length v1, v1

    if-ne v0, v1, :cond_1

    .line 121
    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->animationIntervals:[I

    const/4 v0, 0x0

    .line 123
    iput v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->loopDuration:I

    .line 124
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 125
    iget v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->loopDuration:I

    aget v2, p1, v0

    add-int/2addr v1, v2

    iput v1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->loopDuration:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void

    .line 129
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot set "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p1, p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " frame intervals. The given int[] must have a size of "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->animationIntervals:[I

    array-length p1, p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public setBlendMode(Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->blendMode:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    return-void
.end method

.method public setId(I)V
    .locals 0

    .line 55
    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->id:I

    return-void
.end method

.method public setOffsetX(F)V
    .locals 1

    .line 102
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Cannot set offset of AnimatedTiledMapTile."

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setOffsetY(F)V
    .locals 1

    .line 112
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Cannot set offset of AnimatedTiledMapTile."

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setTextureRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 1

    .line 92
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Cannot set the texture region of AnimatedTiledMapTile."

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
