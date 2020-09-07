.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;
.super Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Pointer;
.source "FreeType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Size"
.end annotation


# direct methods
.method constructor <init>(J)V
    .locals 0

    .line 301
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Pointer;-><init>(J)V

    return-void
.end method

.method private static native getMetrics(J)J
.end method


# virtual methods
.method public getMetrics()Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;
    .locals 3

    .line 305
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;

    iget-wide v1, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;->address:J

    invoke-static {v1, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Size;->getMetrics(J)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;-><init>(J)V

    return-object v0
.end method
