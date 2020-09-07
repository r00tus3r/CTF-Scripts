.class public Lcom/badlogic/gdx/physics/box2d/Filter;
.super Ljava/lang/Object;
.source "Filter.java"


# instance fields
.field public categoryBits:S

.field public groupIndex:S

.field public maskBits:S


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 23
    iput-short v0, p0, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    const/4 v0, -0x1

    .line 26
    iput-short v0, p0, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    const/4 v0, 0x0

    .line 30
    iput-short v0, p0, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    return-void
.end method
