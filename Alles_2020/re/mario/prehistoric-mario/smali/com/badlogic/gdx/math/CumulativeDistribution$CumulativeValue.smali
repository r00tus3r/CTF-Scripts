.class public Lcom/badlogic/gdx/math/CumulativeDistribution$CumulativeValue;
.super Ljava/lang/Object;
.source "CumulativeDistribution.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/CumulativeDistribution;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CumulativeValue"
.end annotation


# instance fields
.field public frequency:F

.field public interval:F

.field final synthetic this$0:Lcom/badlogic/gdx/math/CumulativeDistribution;

.field public value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/math/CumulativeDistribution;Ljava/lang/Object;FF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;FF)V"
        }
    .end annotation

    .line 19
    iput-object p1, p0, Lcom/badlogic/gdx/math/CumulativeDistribution$CumulativeValue;->this$0:Lcom/badlogic/gdx/math/CumulativeDistribution;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p2, p0, Lcom/badlogic/gdx/math/CumulativeDistribution$CumulativeValue;->value:Ljava/lang/Object;

    .line 21
    iput p3, p0, Lcom/badlogic/gdx/math/CumulativeDistribution$CumulativeValue;->frequency:F

    .line 22
    iput p4, p0, Lcom/badlogic/gdx/math/CumulativeDistribution$CumulativeValue;->interval:F

    return-void
.end method
