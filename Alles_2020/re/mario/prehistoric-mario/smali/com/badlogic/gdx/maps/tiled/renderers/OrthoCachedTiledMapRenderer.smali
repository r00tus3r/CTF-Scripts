.class public Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;
.super Ljava/lang/Object;
.source "OrthoCachedTiledMapRenderer.java"

# interfaces
.implements Lcom/badlogic/gdx/maps/tiled/TiledMapRenderer;
.implements Lcom/badlogic/gdx/utils/Disposable;


# static fields
.field protected static final NUM_VERTICES:I = 0x14

.field private static final tolerance:F = 1.0E-5f


# instance fields
.field protected blending:Z

.field protected final cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

.field protected cached:Z

.field protected canCacheMoreE:Z

.field protected canCacheMoreN:Z

.field protected canCacheMoreS:Z

.field protected canCacheMoreW:Z

.field protected count:I

.field protected final map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

.field protected maxTileHeight:F

.field protected maxTileWidth:F

.field protected overCache:F

.field protected final spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

.field protected unitScale:F

.field protected final vertices:[F

.field protected final viewBounds:Lcom/badlogic/gdx/math/Rectangle;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    const/16 v1, 0x7d0

    .line 70
    invoke-direct {p0, p1, v0, v1}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;FI)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;F)V
    .locals 1

    const/16 v0, 0x7d0

    .line 75
    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;FI)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;FI)V
    .locals 1

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x14

    .line 55
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->vertices:[F

    .line 59
    new-instance v0, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    .line 60
    new-instance v0, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    const/high16 v0, 0x3f000000    # 0.5f

    .line 62
    iput v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->overCache:F

    .line 80
    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    .line 81
    iput p2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    .line 82
    new-instance p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    const/4 p2, 0x1

    invoke-direct {p1, p3, p2}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;-><init>(IZ)V

    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 449
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->dispose()V

    return-void
.end method

.method public getSpriteCache()Lcom/badlogic/gdx/graphics/g2d/SpriteCache;
    .locals 1

    .line 444
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    return-object v0
.end method

.method public invalidateCache()V
    .locals 1

    const/4 v0, 0x0

    .line 410
    iput-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cached:Z

    return-void
.end method

.method public isCached()Z
    .locals 1

    .line 415
    iget-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cached:Z

    return v0
.end method

.method public render()V
    .locals 6

    .line 117
    iget-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cached:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    .line 118
    iput-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cached:Z

    .line 119
    iput v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->count:I

    .line 120
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->clear()V

    .line 122
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v0, v0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    iget v2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->overCache:F

    mul-float v0, v0, v2

    .line 123
    iget-object v2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v2, v2, Lcom/badlogic/gdx/math/Rectangle;->height:F

    iget v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->overCache:F

    mul-float v2, v2, v3

    .line 124
    iget-object v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v4, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v4, v4, Lcom/badlogic/gdx/math/Rectangle;->x:F

    sub-float/2addr v4, v0

    iput v4, v3, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 125
    iget-object v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v4, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v4, v4, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr v4, v2

    iput v4, v3, Lcom/badlogic/gdx/math/Rectangle;->y:F

    .line 126
    iget-object v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v4, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v4, v4, Lcom/badlogic/gdx/math/Rectangle;->width:F

    const/high16 v5, 0x40000000    # 2.0f

    mul-float v0, v0, v5

    add-float/2addr v4, v0

    iput v4, v3, Lcom/badlogic/gdx/math/Rectangle;->width:F

    .line 127
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v3, v3, Lcom/badlogic/gdx/math/Rectangle;->height:F

    mul-float v2, v2, v5

    add-float/2addr v3, v2

    iput v3, v0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    .line 129
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/MapLayers;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/maps/MapLayer;

    .line 130
    iget-object v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->beginCache()V

    .line 131
    instance-of v3, v2, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    if-eqz v3, :cond_0

    .line 132
    check-cast v2, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->renderTileLayer(Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;)V

    goto :goto_1

    .line 133
    :cond_0
    instance-of v3, v2, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;

    if-eqz v3, :cond_1

    .line 134
    check-cast v2, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->renderImageLayer(Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;)V

    .line 136
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->endCache()I

    goto :goto_0

    .line 140
    :cond_2
    iget-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->blending:Z

    const/16 v2, 0xbe2

    if-eqz v0, :cond_3

    .line 141
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0, v2}, Lcom/badlogic/gdx/graphics/GL20;->glEnable(I)V

    .line 142
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v3, 0x302

    const/16 v4, 0x303

    invoke-interface {v0, v3, v4}, Lcom/badlogic/gdx/graphics/GL20;->glBlendFunc(II)V

    .line 144
    :cond_3
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->begin()V

    .line 145
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v0

    .line 146
    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/MapLayers;->getCount()I

    move-result v3

    :goto_2
    if-ge v1, v3, :cond_5

    .line 147
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/maps/MapLayers;->get(I)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object v4

    .line 148
    invoke-virtual {v4}, Lcom/badlogic/gdx/maps/MapLayer;->isVisible()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 149
    iget-object v5, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v5, v1}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->draw(I)V

    .line 150
    invoke-virtual {p0, v4}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->renderObjects(Lcom/badlogic/gdx/maps/MapLayer;)V

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 153
    :cond_5
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->end()V

    .line 154
    iget-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->blending:Z

    if-eqz v0, :cond_6

    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0, v2}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    :cond_6
    return-void
.end method

.method public render([I)V
    .locals 7

    .line 159
    iget-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cached:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    .line 160
    iput-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cached:Z

    .line 161
    iput v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->count:I

    .line 162
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->clear()V

    .line 164
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v0, v0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    iget v2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->overCache:F

    mul-float v0, v0, v2

    .line 165
    iget-object v2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v2, v2, Lcom/badlogic/gdx/math/Rectangle;->height:F

    iget v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->overCache:F

    mul-float v2, v2, v3

    .line 166
    iget-object v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v4, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v4, v4, Lcom/badlogic/gdx/math/Rectangle;->x:F

    sub-float/2addr v4, v0

    iput v4, v3, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 167
    iget-object v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v4, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v4, v4, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr v4, v2

    iput v4, v3, Lcom/badlogic/gdx/math/Rectangle;->y:F

    .line 168
    iget-object v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v4, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v4, v4, Lcom/badlogic/gdx/math/Rectangle;->width:F

    const/high16 v5, 0x40000000    # 2.0f

    mul-float v0, v0, v5

    add-float/2addr v4, v0

    iput v4, v3, Lcom/badlogic/gdx/math/Rectangle;->width:F

    .line 169
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v3, v3, Lcom/badlogic/gdx/math/Rectangle;->height:F

    mul-float v2, v2, v5

    add-float/2addr v3, v2

    iput v3, v0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    .line 171
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/MapLayers;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/maps/MapLayer;

    .line 172
    iget-object v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->beginCache()V

    .line 173
    instance-of v3, v2, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    if-eqz v3, :cond_0

    .line 174
    check-cast v2, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->renderTileLayer(Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;)V

    goto :goto_1

    .line 175
    :cond_0
    instance-of v3, v2, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;

    if-eqz v3, :cond_1

    .line 176
    check-cast v2, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->renderImageLayer(Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;)V

    .line 178
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->endCache()I

    goto :goto_0

    .line 182
    :cond_2
    iget-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->blending:Z

    const/16 v2, 0xbe2

    if-eqz v0, :cond_3

    .line 183
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0, v2}, Lcom/badlogic/gdx/graphics/GL20;->glEnable(I)V

    .line 184
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v3, 0x302

    const/16 v4, 0x303

    invoke-interface {v0, v3, v4}, Lcom/badlogic/gdx/graphics/GL20;->glBlendFunc(II)V

    .line 186
    :cond_3
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->begin()V

    .line 187
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v0

    .line 188
    array-length v3, p1

    :goto_2
    if-ge v1, v3, :cond_5

    aget v4, p1, v1

    .line 189
    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/maps/MapLayers;->get(I)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object v5

    .line 190
    invoke-virtual {v5}, Lcom/badlogic/gdx/maps/MapLayer;->isVisible()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 191
    iget-object v6, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v6, v4}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->draw(I)V

    .line 192
    invoke-virtual {p0, v5}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->renderObjects(Lcom/badlogic/gdx/maps/MapLayer;)V

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 195
    :cond_5
    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->end()V

    .line 196
    iget-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->blending:Z

    if-eqz p1, :cond_6

    sget-object p1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {p1, v2}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    :cond_6
    return-void
.end method

.method public renderImageLayer(Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;)V
    .locals 12

    .line 360
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->getOpacity()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1, v1, v1, v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits(FFFF)F

    move-result v0

    .line 361
    iget-object v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->vertices:[F

    .line 363
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v2

    if-nez v2, :cond_0

    return-void

    .line 369
    :cond_0
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->getX()F

    move-result v3

    .line 370
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->getY()F

    move-result p1

    .line 371
    iget v4, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v3, v3, v4

    mul-float p1, p1, v4

    .line 373
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v4, v4, v5

    add-float/2addr v4, v3

    .line 374
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v5

    int-to-float v5, v5

    iget v6, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v5, v5, v6

    add-float/2addr v5, p1

    .line 376
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU()F

    move-result v6

    .line 377
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV2()F

    move-result v7

    .line 378
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU2()F

    move-result v8

    .line 379
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV()F

    move-result v9

    const/4 v10, 0x0

    .line 381
    aput v3, v1, v10

    const/4 v11, 0x1

    .line 382
    aput p1, v1, v11

    const/4 v11, 0x2

    .line 383
    aput v0, v1, v11

    const/4 v11, 0x3

    .line 384
    aput v6, v1, v11

    const/4 v11, 0x4

    .line 385
    aput v7, v1, v11

    const/4 v11, 0x5

    .line 387
    aput v3, v1, v11

    const/4 v3, 0x6

    .line 388
    aput v5, v1, v3

    const/4 v3, 0x7

    .line 389
    aput v0, v1, v3

    const/16 v3, 0x8

    .line 390
    aput v6, v1, v3

    const/16 v3, 0x9

    .line 391
    aput v9, v1, v3

    const/16 v3, 0xa

    .line 393
    aput v4, v1, v3

    const/16 v3, 0xb

    .line 394
    aput v5, v1, v3

    const/16 v3, 0xc

    .line 395
    aput v0, v1, v3

    const/16 v3, 0xd

    .line 396
    aput v8, v1, v3

    const/16 v3, 0xe

    .line 397
    aput v9, v1, v3

    const/16 v3, 0xf

    .line 399
    aput v4, v1, v3

    const/16 v3, 0x10

    .line 400
    aput p1, v1, v3

    const/16 p1, 0x11

    .line 401
    aput v0, v1, p1

    const/16 p1, 0x12

    .line 402
    aput v8, v1, p1

    const/16 p1, 0x13

    .line 403
    aput v7, v1, p1

    .line 405
    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v0

    const/16 v2, 0x14

    invoke-virtual {p1, v0, v1, v10, v2}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    return-void
.end method

.method public renderObject(Lcom/badlogic/gdx/maps/MapObject;)V
    .locals 0

    return-void
.end method

.method public renderObjects(Lcom/badlogic/gdx/maps/MapLayer;)V
    .locals 1

    .line 201
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/MapLayer;->getObjects()Lcom/badlogic/gdx/maps/MapObjects;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/MapObjects;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/maps/MapObject;

    .line 202
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->renderObject(Lcom/badlogic/gdx/maps/MapObject;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public renderTileLayer(Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;)V
    .locals 30

    move-object/from16 v0, p0

    .line 212
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getOpacity()F

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2, v2, v2, v1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits(FFFF)F

    move-result v1

    .line 214
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getWidth()I

    move-result v2

    .line 215
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getHeight()I

    move-result v3

    .line 217
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getTileWidth()F

    move-result v4

    iget v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v4, v4, v5

    .line 218
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getTileHeight()F

    move-result v5

    iget v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v5, v5, v6

    .line 220
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getRenderOffsetX()F

    move-result v6

    iget v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v6, v6, v7

    .line 222
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getRenderOffsetY()F

    move-result v7

    neg-float v7, v7

    iget v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v7, v7, v8

    .line 224
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v8, v8, Lcom/badlogic/gdx/math/Rectangle;->x:F

    sub-float/2addr v8, v6

    div-float/2addr v8, v4

    float-to-int v8, v8

    const/4 v9, 0x0

    invoke-static {v9, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 225
    iget-object v10, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v10, v10, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object v11, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v11, v11, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v10, v11

    add-float/2addr v10, v4

    sub-float/2addr v10, v6

    div-float/2addr v10, v4

    float-to-int v10, v10

    invoke-static {v2, v10}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 228
    iget-object v11, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v11, v11, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr v11, v7

    div-float/2addr v11, v5

    float-to-int v11, v11

    invoke-static {v9, v11}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 229
    iget-object v12, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v12, v12, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object v13, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v13, v13, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v12, v13

    add-float/2addr v12, v5

    sub-float/2addr v12, v7

    div-float/2addr v12, v5

    float-to-int v12, v12

    invoke-static {v3, v12}, Ljava/lang/Math;->min(II)I

    move-result v12

    const/4 v13, 0x1

    if-ge v12, v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 232
    :goto_0
    iput-boolean v3, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->canCacheMoreN:Z

    if-ge v10, v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    .line 233
    :goto_1
    iput-boolean v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->canCacheMoreE:Z

    if-lez v8, :cond_2

    const/4 v2, 0x1

    goto :goto_2

    :cond_2
    const/4 v2, 0x0

    .line 234
    :goto_2
    iput-boolean v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->canCacheMoreW:Z

    if-lez v11, :cond_3

    const/4 v2, 0x1

    goto :goto_3

    :cond_3
    const/4 v2, 0x0

    .line 235
    :goto_3
    iput-boolean v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->canCacheMoreS:Z

    .line 237
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->vertices:[F

    :goto_4
    if-lt v12, v11, :cond_d

    move v3, v8

    :goto_5
    if-ge v3, v10, :cond_c

    move-object/from16 v14, p1

    .line 240
    invoke-virtual {v14, v3, v12}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getCell(II)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v15

    if-nez v15, :cond_4

    :goto_6
    move/from16 v22, v4

    move/from16 v21, v5

    move/from16 v16, v6

    move/from16 v23, v7

    move/from16 v20, v8

    move/from16 v25, v10

    move/from16 v19, v11

    const/4 v6, 0x0

    const/4 v7, 0x1

    goto/16 :goto_8

    .line 243
    :cond_4
    invoke-virtual {v15}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getTile()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v16

    if-nez v16, :cond_5

    goto :goto_6

    .line 246
    :cond_5
    iget v9, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->count:I

    add-int/2addr v9, v13

    iput v9, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->count:I

    .line 247
    invoke-virtual {v15}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getFlipHorizontally()Z

    move-result v9

    .line 248
    invoke-virtual {v15}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getFlipVertically()Z

    move-result v18

    .line 249
    invoke-virtual {v15}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getRotation()I

    move-result v15

    .line 251
    invoke-interface/range {v16 .. v16}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v19

    .line 252
    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v13

    move/from16 v20, v8

    int-to-float v8, v3

    mul-float v8, v8, v4

    .line 254
    invoke-interface/range {v16 .. v16}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getOffsetX()F

    move-result v21

    move/from16 v22, v4

    iget v4, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v21, v21, v4

    add-float v8, v8, v21

    add-float/2addr v8, v6

    int-to-float v4, v12

    mul-float v4, v4, v5

    .line 255
    invoke-interface/range {v16 .. v16}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getOffsetY()F

    move-result v16

    move/from16 v21, v5

    iget v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v16, v16, v5

    add-float v4, v4, v16

    add-float/2addr v4, v7

    .line 256
    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v5

    int-to-float v5, v5

    move/from16 v16, v6

    iget v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v5, v5, v6

    add-float/2addr v5, v8

    .line 257
    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v6

    int-to-float v6, v6

    move/from16 v23, v7

    iget v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v6, v6, v7

    add-float/2addr v6, v4

    .line 259
    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v7

    int-to-float v7, v7

    const/high16 v24, 0x3f000000    # 0.5f

    div-float v7, v24, v7

    move/from16 v25, v10

    .line 260
    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v10

    int-to-float v10, v10

    div-float v24, v24, v10

    .line 261
    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU()F

    move-result v10

    add-float/2addr v10, v7

    .line 262
    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV2()F

    move-result v26

    sub-float v26, v26, v24

    .line 263
    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU2()F

    move-result v27

    sub-float v27, v27, v7

    .line 264
    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV()F

    move-result v7

    add-float v7, v7, v24

    const/16 v17, 0x0

    .line 266
    aput v8, v2, v17

    const/16 v19, 0x1

    .line 267
    aput v4, v2, v19

    move/from16 v19, v11

    const/4 v11, 0x2

    .line 268
    aput v1, v2, v11

    const/4 v11, 0x3

    .line 269
    aput v10, v2, v11

    const/16 v28, 0x4

    .line 270
    aput v26, v2, v28

    const/16 v29, 0x5

    .line 272
    aput v8, v2, v29

    const/4 v8, 0x6

    .line 273
    aput v6, v2, v8

    const/4 v8, 0x7

    .line 274
    aput v1, v2, v8

    const/16 v8, 0x8

    .line 275
    aput v10, v2, v8

    const/16 v10, 0x9

    .line 276
    aput v7, v2, v10

    const/16 v29, 0xa

    .line 278
    aput v5, v2, v29

    const/16 v29, 0xb

    .line 279
    aput v6, v2, v29

    const/16 v6, 0xc

    .line 280
    aput v1, v2, v6

    const/16 v6, 0xd

    .line 281
    aput v27, v2, v6

    const/16 v29, 0xe

    .line 282
    aput v7, v2, v29

    const/16 v7, 0xf

    .line 284
    aput v5, v2, v7

    const/16 v5, 0x10

    .line 285
    aput v4, v2, v5

    const/16 v4, 0x11

    .line 286
    aput v1, v2, v4

    const/16 v4, 0x12

    .line 287
    aput v27, v2, v4

    const/16 v5, 0x13

    .line 288
    aput v26, v2, v5

    if-eqz v9, :cond_6

    .line 291
    aget v7, v2, v11

    .line 292
    aget v9, v2, v6

    aput v9, v2, v11

    .line 293
    aput v7, v2, v6

    .line 294
    aget v7, v2, v8

    .line 295
    aget v9, v2, v4

    aput v9, v2, v8

    .line 296
    aput v7, v2, v4

    :cond_6
    if-eqz v18, :cond_7

    .line 299
    aget v7, v2, v28

    .line 300
    aget v9, v2, v29

    aput v9, v2, v28

    .line 301
    aput v7, v2, v29

    .line 302
    aget v7, v2, v10

    .line 303
    aget v9, v2, v5

    aput v9, v2, v10

    .line 304
    aput v7, v2, v5

    :cond_7
    if-eqz v15, :cond_b

    const/4 v7, 0x1

    if-eq v15, v7, :cond_a

    const/4 v9, 0x2

    if-eq v15, v9, :cond_9

    if-eq v15, v11, :cond_8

    goto :goto_7

    .line 338
    :cond_8
    aget v9, v2, v28

    .line 339
    aget v15, v2, v5

    aput v15, v2, v28

    .line 340
    aget v15, v2, v29

    aput v15, v2, v5

    .line 341
    aget v5, v2, v10

    aput v5, v2, v29

    .line 342
    aput v9, v2, v10

    .line 344
    aget v5, v2, v11

    .line 345
    aget v9, v2, v4

    aput v9, v2, v11

    .line 346
    aget v9, v2, v6

    aput v9, v2, v4

    .line 347
    aget v4, v2, v8

    aput v4, v2, v6

    .line 348
    aput v5, v2, v8

    goto :goto_7

    .line 323
    :cond_9
    aget v9, v2, v11

    .line 324
    aget v15, v2, v6

    aput v15, v2, v11

    .line 325
    aput v9, v2, v6

    .line 326
    aget v6, v2, v8

    .line 327
    aget v9, v2, v4

    aput v9, v2, v8

    .line 328
    aput v6, v2, v4

    .line 329
    aget v4, v2, v28

    .line 330
    aget v6, v2, v29

    aput v6, v2, v28

    .line 331
    aput v4, v2, v29

    .line 332
    aget v4, v2, v10

    .line 333
    aget v6, v2, v5

    aput v6, v2, v10

    .line 334
    aput v4, v2, v5

    goto :goto_7

    .line 309
    :cond_a
    aget v9, v2, v28

    .line 310
    aget v15, v2, v10

    aput v15, v2, v28

    .line 311
    aget v15, v2, v29

    aput v15, v2, v10

    .line 312
    aget v10, v2, v5

    aput v10, v2, v29

    .line 313
    aput v9, v2, v5

    .line 315
    aget v5, v2, v11

    .line 316
    aget v9, v2, v8

    aput v9, v2, v11

    .line 317
    aget v9, v2, v6

    aput v9, v2, v8

    .line 318
    aget v8, v2, v4

    aput v8, v2, v6

    .line 319
    aput v5, v2, v4

    goto :goto_7

    :cond_b
    const/4 v7, 0x1

    .line 353
    :goto_7
    iget-object v4, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    const/16 v5, 0x14

    const/4 v6, 0x0

    invoke-virtual {v4, v13, v2, v6, v5}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    :goto_8
    add-int/lit8 v3, v3, 0x1

    move/from16 v6, v16

    move/from16 v11, v19

    move/from16 v8, v20

    move/from16 v5, v21

    move/from16 v4, v22

    move/from16 v7, v23

    move/from16 v10, v25

    const/4 v9, 0x0

    const/4 v13, 0x1

    goto/16 :goto_5

    :cond_c
    move-object/from16 v14, p1

    move/from16 v22, v4

    move/from16 v21, v5

    move/from16 v16, v6

    move/from16 v23, v7

    move/from16 v20, v8

    move/from16 v25, v10

    move/from16 v19, v11

    const/4 v6, 0x0

    const/4 v7, 0x1

    add-int/lit8 v12, v12, -0x1

    move/from16 v6, v16

    move/from16 v7, v23

    const/4 v9, 0x0

    const/4 v13, 0x1

    goto/16 :goto_4

    :cond_d
    return-void
.end method

.method public setBlending(Z)V
    .locals 0

    .line 440
    iput-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->blending:Z

    return-void
.end method

.method public setMaxTileSize(FF)V
    .locals 0

    .line 435
    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->maxTileWidth:F

    .line 436
    iput p2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->maxTileHeight:F

    return-void
.end method

.method public setOverCache(F)V
    .locals 0

    .line 423
    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->overCache:F

    return-void
.end method

.method public setView(Lcom/badlogic/gdx/graphics/OrthographicCamera;)V
    .locals 6

    .line 87
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->combined:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->setProjectionMatrix(Lcom/badlogic/gdx/math/Matrix4;)V

    .line 88
    iget v0, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportWidth:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    mul-float v0, v0, v1

    iget v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->maxTileWidth:F

    const/high16 v2, 0x40000000    # 2.0f

    mul-float v1, v1, v2

    iget v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v1, v1, v3

    add-float/2addr v0, v1

    .line 89
    iget v1, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportHeight:F

    iget v3, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    mul-float v1, v1, v3

    iget v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->maxTileHeight:F

    mul-float v3, v3, v2

    iget v4, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v3, v3, v4

    add-float/2addr v1, v3

    .line 90
    iget-object v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v4, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector3;->x:F

    div-float v5, v0, v2

    sub-float/2addr v4, v5

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    div-float v2, v1, v2

    sub-float/2addr p1, v2

    invoke-virtual {v3, v4, p1, v0, v1}, Lcom/badlogic/gdx/math/Rectangle;->set(FFFF)Lcom/badlogic/gdx/math/Rectangle;

    .line 92
    iget-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->canCacheMoreW:Z

    const v0, 0x3727c5ac    # 1.0E-5f

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    sub-float/2addr v1, v0

    cmpg-float p1, p1, v1

    if-ltz p1, :cond_3

    :cond_0
    iget-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->canCacheMoreS:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr v1, v0

    cmpg-float p1, p1, v1

    if-ltz p1, :cond_3

    :cond_1
    iget-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->canCacheMoreE:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr p1, v1

    iget-object v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object v2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v2, v2, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v1, v2

    add-float/2addr v1, v0

    cmpl-float p1, p1, v1

    if-gtz p1, :cond_3

    :cond_2
    iget-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->canCacheMoreN:Z

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr p1, v1

    iget-object v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object v2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v2, v2, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v1, v2

    add-float/2addr v1, v0

    cmpl-float p1, p1, v1

    if-lez p1, :cond_4

    :cond_3
    const/4 p1, 0x0

    .line 96
    iput-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cached:Z

    :cond_4
    return-void
.end method

.method public setView(Lcom/badlogic/gdx/math/Matrix4;FFFF)V
    .locals 3

    .line 101
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->spriteCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->setProjectionMatrix(Lcom/badlogic/gdx/math/Matrix4;)V

    .line 102
    iget p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->maxTileWidth:F

    iget v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->unitScale:F

    mul-float v1, p1, v0

    sub-float/2addr p2, v1

    .line 103
    iget v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->maxTileHeight:F

    mul-float v2, v1, v0

    sub-float/2addr p3, v2

    const/high16 v2, 0x40000000    # 2.0f

    mul-float p1, p1, v2

    mul-float p1, p1, v0

    add-float/2addr p4, p1

    mul-float v1, v1, v2

    mul-float v1, v1, v0

    add-float/2addr p5, v1

    .line 106
    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    invoke-virtual {p1, p2, p3, p4, p5}, Lcom/badlogic/gdx/math/Rectangle;->set(FFFF)Lcom/badlogic/gdx/math/Rectangle;

    .line 108
    iget-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->canCacheMoreW:Z

    const p2, 0x3727c5ac    # 1.0E-5f

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object p3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p3, p3, Lcom/badlogic/gdx/math/Rectangle;->x:F

    sub-float/2addr p3, p2

    cmpg-float p1, p1, p3

    if-ltz p1, :cond_3

    :cond_0
    iget-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->canCacheMoreS:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object p3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p3, p3, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr p3, p2

    cmpg-float p1, p1, p3

    if-ltz p1, :cond_3

    :cond_1
    iget-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->canCacheMoreE:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object p3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p3, p3, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr p1, p3

    iget-object p3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p3, p3, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object p4, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p4, p4, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr p3, p4

    add-float/2addr p3, p2

    cmpl-float p1, p1, p3

    if-gtz p1, :cond_3

    :cond_2
    iget-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->canCacheMoreN:Z

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object p3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p3, p3, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr p1, p3

    iget-object p3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p3, p3, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object p4, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cacheBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget p4, p4, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr p3, p4

    add-float/2addr p3, p2

    cmpl-float p1, p1, p3

    if-lez p1, :cond_4

    :cond_3
    const/4 p1, 0x0

    .line 112
    iput-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthoCachedTiledMapRenderer;->cached:Z

    :cond_4
    return-void
.end method
