.class Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage;
.super Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page;
.source "PixmapPacker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SkylinePage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;
    }
.end annotation


# instance fields
.field rows:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage$Row;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;)V
    .locals 0

    .line 706
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$Page;-><init>(Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;)V

    .line 703
    new-instance p1, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker$SkylineStrategy$SkylinePage;->rows:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method
