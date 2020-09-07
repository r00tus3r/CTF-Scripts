.class Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page$1;
.super Lcom/badlogic/gdx/graphics/Texture;
.source "PixmapPacker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page;->updateTexture(Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page;Lcom/badlogic/gdx/graphics/TextureData;)V
    .locals 0

    .line 506
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page$1;->this$0:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page;

    invoke-direct {p0, p2}, Lcom/badlogic/gdx/graphics/Texture;-><init>(Lcom/badlogic/gdx/graphics/TextureData;)V

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 509
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/Texture;->dispose()V

    .line 510
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page$1;->this$0:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page;->image:Lcom/badlogic/gdx/graphics/Pixmap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Pixmap;->dispose()V

    return-void
.end method
