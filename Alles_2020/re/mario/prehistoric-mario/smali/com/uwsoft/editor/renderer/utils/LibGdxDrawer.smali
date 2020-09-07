.class public Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;
.super Lcom/brashmonkey/spriter/Drawer;
.source "LibGdxDrawer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/brashmonkey/spriter/Drawer<",
        "Lcom/badlogic/gdx/graphics/g2d/Sprite;",
        ">;"
    }
.end annotation


# instance fields
.field batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

.field renderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;


# direct methods
.method public constructor <init>(Lcom/brashmonkey/spriter/Loader;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/brashmonkey/spriter/Loader<",
            "Lcom/badlogic/gdx/graphics/g2d/Sprite;",
            ">;",
            "Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;",
            ")V"
        }
    .end annotation

    .line 18
    invoke-direct {p0, p1}, Lcom/brashmonkey/spriter/Drawer;-><init>(Lcom/brashmonkey/spriter/Loader;)V

    .line 19
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    return-void
.end method


# virtual methods
.method public beforeDraw(Lcom/brashmonkey/spriter/Player;Lcom/badlogic/gdx/graphics/g2d/Batch;)V
    .locals 0

    .line 43
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    .line 44
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;->draw(Lcom/brashmonkey/spriter/Player;)V

    return-void
.end method

.method public circle(FFF)V
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->circle(FFF)V

    return-void
.end method

.method public draw(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V
    .locals 5

    .line 48
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;->loader:Lcom/brashmonkey/spriter/Loader;

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Loader;->get(Lcom/brashmonkey/spriter/FileReference;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    .line 50
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getWidth()F

    move-result v1

    iget-object v2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->x:F

    mul-float v1, v1, v2

    .line 51
    iget-object v2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->x:F

    sub-float/2addr v2, v1

    .line 52
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getHeight()F

    move-result v3

    iget-object v4, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v4, v4, Lcom/brashmonkey/spriter/Point;->y:F

    mul-float v3, v3, v4

    .line 53
    iget-object v4, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v4, v4, Lcom/brashmonkey/spriter/Point;->y:F

    sub-float/2addr v4, v3

    .line 55
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setX(F)V

    .line 56
    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setY(F)V

    .line 57
    invoke-virtual {v0, v1, v3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setOrigin(FF)V

    .line 58
    iget v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->angle:F

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setRotation(F)V

    .line 60
    iget v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2, v2, v2, v1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setColor(FFFF)V

    .line 61
    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->scale:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object p1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->scale:Lcom/brashmonkey/spriter/Point;

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {v0, v1, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setScale(FF)V

    .line 62
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;)V

    return-void
.end method

.method public line(FFFF)V
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->line(FFFF)V

    return-void
.end method

.method public rectangle(FFFF)V
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->rect(FFFF)V

    return-void
.end method

.method public setColor(FFFF)V
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->setColor(FFFF)V

    return-void
.end method
