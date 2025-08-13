namespace TaterGame.SteamShooter.Core;

public interface ICharacter
{
    public void MoveLeft();
    public void MoveRight();
    public void MoveIdle();
    public void Jump();
}