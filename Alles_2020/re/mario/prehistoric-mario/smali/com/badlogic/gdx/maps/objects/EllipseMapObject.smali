.class public Lcom/badlogic/gdx/maps/objects/EllipseMapObject;
.super Lcom/badlogic/gdx/maps/MapObject;
.source "EllipseMapObject.java"


# instance fields
.field private ellipse:Lcom/badlogic/gdx/math/Ellipse;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 35
    invoke-direct {p0, v1, v1, v0, v0}, Lcom/badlogic/gdx/maps/objects/EllipseMapObject;-><init>(FFFF)V

    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 1

    .line 45
    invoke-direct {p0}, Lcom/badlogic/gdx/maps/MapObject;-><init>()V

    .line 46
    new-instance v0, Lcom/badlogic/gdx/math/Ellipse;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/math/Ellipse;-><init>(FFFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/objects/EllipseMapObject;->ellipse:Lcom/badlogic/gdx/math/Ellipse;

    return-void
.end method


# virtual methods
.method public getEllipse()Lcom/badlogic/gdx/math/Ellipse;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/badlogic/gdx/maps/objects/EllipseMapObject;->ellipse:Lcom/badlogic/gdx/math/Ellipse;

    return-object v0
.end method
