using Godot;
using System;

namespace TaterGame.SteamShooter.Core;

public partial class CharacterControl : CharacterBody2D, ICharacter
{
    [Export(PropertyHint.Range,"0.1,10")]
    public float Speed;
    public override void _PhysicsProcess(double delta)
    {
        GD.Print(Velocity);
        MoveAndSlide();
    }

    public void MoveLeft()
    {
        Velocity = Velocity with { X = Speed * -1 };
    }

    public void MoveRight()
    {
        Velocity = Velocity with { X = Speed * 1 };
    }

    public void MoveIdle()
    {
        Velocity = Velocity with { X = 0 };
    }

    public void Jump()
    {
        
    }
}
