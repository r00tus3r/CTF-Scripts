.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;
.super Lcom/badlogic/gdx/assets/AssetLoaderParameters;
.source "FreetypeFontLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FreeTypeFontLoaderParameter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/AssetLoaderParameters<",
        "Lcom/badlogic/gdx/graphics/g2d/BitmapFont;",
        ">;"
    }
.end annotation


# instance fields
.field public fontFileName:Ljava/lang/String;

.field public fontParameters:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/badlogic/gdx/assets/AssetLoaderParameters;-><init>()V

    .line 29
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;->fontParameters:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;

    return-void
.end method
