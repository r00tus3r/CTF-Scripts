.class public Lcom/badlogic/gdx/maps/objects/RectangleMapObject;
.super Lcom/badlogic/gdx/maps/MapObject;
.source "RectangleMapObject.java"


# instance fields
.field private rectangle:Lcom/badlogic/gdx/math/Rectangle;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 34
    invoke-direct {p0, v1, v1, v0, v0}, Lcom/badlogic/gdx/maps/objects/RectangleMapObject;-><init>(FFFF)V

    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 1

    .line 44
    invoke-direct {p0}, Lcom/badlogic/gdx/maps/MapObject;-><init>()V

    .line 45
    new-instance v0, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/math/Rectangle;-><init>(FFFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/objects/RectangleMapObject;->rectangle:Lcom/badlogic/gdx/math/Rectangle;

    return-void
.end method


# virtual methods
.method public getRectangle()Lcom/badlogic/gdx/math/Rectangle;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/badlogic/gdx/maps/objects/RectangleMapObject;->rectangle:Lcom/badlogic/gdx/math/Rectangle;

    return-object v0
.end method
