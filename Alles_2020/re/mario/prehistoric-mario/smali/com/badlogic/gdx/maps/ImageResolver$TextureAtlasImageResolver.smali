.class public Lcom/badlogic/gdx/maps/ImageResolver$TextureAtlasImageResolver;
.super Ljava/lang/Object;
.source "ImageResolver.java"

# interfaces
.implements Lcom/badlogic/gdx/maps/ImageResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/maps/ImageResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TextureAtlasImageResolver"
.end annotation


# instance fields
.field private final atlas:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/badlogic/gdx/maps/ImageResolver$TextureAtlasImageResolver;->atlas:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    return-void
.end method


# virtual methods
.method public getImage(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/badlogic/gdx/maps/ImageResolver$TextureAtlasImageResolver;->atlas:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;->findRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    move-result-object p1

    return-object p1
.end method
