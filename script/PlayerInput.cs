using System.Diagnostics;
using Godot;

namespace TaterGame.SteamShooter.Core;

[Tool]
public partial class PlayerInput: Node
{
    private ICharacter m_Parent;
    
    [Export]
    public float Direction { get; private set; }
    
    [Signal]
    public delegate void MoveLeftEventHandler();
    
    public override void _EnterTree()
    {
        m_Parent = this.GetParent<ICharacter>();
        Debug.Assert(m_Parent!=null,"无法获取到玩家");
    }

    public override void _Process(double delta)
    {
        Direction = Input.GetAxis("ui_left", "ui_right");
        if (Direction > 0)
        {
            m_Parent.MoveRight();
        }
        else if (Mathf.IsZeroApprox(Direction))
        {
            m_Parent.MoveIdle();
        }
        else if (Direction < 0)
        {
            m_Parent.MoveLeft();
        }
    }
}