.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;
.super Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Pointer;
.source "FreeType.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Stroker"
.end annotation


# direct methods
.method constructor <init>(J)V
    .locals 0

    .line 737
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Pointer;-><init>(J)V

    return-void
.end method

.method private static native done(J)V
.end method

.method private static native set(JIIII)V
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 750
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;->done(J)V

    return-void
.end method

.method public set(IIII)V
    .locals 6

    .line 741
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;->address:J

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Stroker;->set(JIIII)V

    return-void
.end method
