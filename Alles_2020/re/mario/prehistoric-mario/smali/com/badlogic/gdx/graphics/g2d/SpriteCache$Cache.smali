.class Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;
.super Ljava/lang/Object;
.source "SpriteCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/SpriteCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Cache"
.end annotation


# instance fields
.field counts:[I

.field final id:I

.field maxCount:I

.field final offset:I

.field textureCount:I

.field textures:[Lcom/badlogic/gdx/graphics/Texture;


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 972
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 973
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->id:I

    .line 974
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->offset:I

    return-void
.end method
