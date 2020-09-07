.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;
.super Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Pointer;
.source "FreeType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SizeMetrics"
.end annotation


# direct methods
.method constructor <init>(J)V
    .locals 0

    .line 315
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Pointer;-><init>(J)V

    return-void
.end method

.method private static native getAscender(J)I
.end method

.method private static native getDescender(J)I
.end method

.method private static native getHeight(J)I
.end method

.method private static native getMaxAdvance(J)I
.end method

.method private static native getXppem(J)I
.end method

.method private static native getXscale(J)I
.end method

.method private static native getYppem(J)I
.end method

.method private static native getYscale(J)I
.end method


# virtual methods
.method public getAscender()I
    .locals 2

    .line 351
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getAscender(J)I

    move-result v0

    return v0
.end method

.method public getDescender()I
    .locals 2

    .line 359
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getDescender(J)I

    move-result v0

    return v0
.end method

.method public getHeight()I
    .locals 2

    .line 367
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getHeight(J)I

    move-result v0

    return v0
.end method

.method public getMaxAdvance()I
    .locals 2

    .line 375
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getMaxAdvance(J)I

    move-result v0

    return v0
.end method

.method public getXScale()I
    .locals 2

    .line 335
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getXscale(J)I

    move-result v0

    return v0
.end method

.method public getXppem()I
    .locals 2

    .line 319
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getXppem(J)I

    move-result v0

    return v0
.end method

.method public getYppem()I
    .locals 2

    .line 327
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getYppem(J)I

    move-result v0

    return v0
.end method

.method public getYscale()I
    .locals 2

    .line 343
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$SizeMetrics;->getYscale(J)I

    move-result v0

    return v0
.end method
