.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$GlyphAndBitmap;
.super Ljava/lang/Object;
.source "FreeTypeFontGenerator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GlyphAndBitmap"
.end annotation


# instance fields
.field public bitmap:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;

.field public glyph:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$Glyph;

.field final synthetic this$0:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;)V
    .locals 0

    .line 207
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$GlyphAndBitmap;->this$0:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
