.class public Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;
.super Lcom/badlogic/gdx/graphics/g2d/Sprite;
.source "ParticleEmitter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Particle"
.end annotation


# instance fields
.field protected angle:F

.field protected angleCos:F

.field protected angleDiff:F

.field protected angleSin:F

.field protected currentLife:I

.field protected frame:I

.field protected gravity:F

.field protected gravityDiff:F

.field protected life:I

.field protected rotation:F

.field protected rotationDiff:F

.field protected tint:[F

.field protected transparency:F

.field protected transparencyDiff:F

.field protected velocity:F

.field protected velocityDiff:F

.field protected wind:F

.field protected windDiff:F

.field protected xScale:F

.field protected xScaleDiff:F

.field protected yScale:F

.field protected yScaleDiff:F


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V
    .locals 0

    .line 1221
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;-><init>(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V

    return-void
.end method
