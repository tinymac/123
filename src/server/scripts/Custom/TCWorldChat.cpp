/***A Trinity Core World Chat Script ****
*________________< >____________________*
*_______________________________________*
* People Contributed to this script     *
*                                       *
*  Recoded & Edit: ak47sigh(AlexeWarr)  *
*  Redone it all: Tommy                 *
*                                       *
*****************************************
*/

#include "Chat.h"

class World_Chat : public CommandScript
{
public:
    World_Chat() : CommandScript("World_Chat") { }

    ChatCommand * GetCommands() const
    {
        static ChatCommand HandleWorldChatCommandTable[] =
        {
            { "world",        SEC_PLAYER,         true,     &HandleWorldChatCommand,               "",  NULL },
            { NULL,              0,               false,    NULL,                                  "",  NULL }
        };
        return HandleWorldChatCommandTable;
    }

    static bool HandleWorldChatCommand(ChatHandler* handler, const char* msg)
    {
        if (!*msg)
            return false;

        Player* player = handler->GetSession()->GetPlayer();

        std::string rank, color, message;
        std::ostringstream chat_string;

        switch (player->GetSession()->GetSecurity())
        {
            case SEC_PLAYER:		
                rank = "Player";
                color = "|cffADD8E6";
                break;
            case SEC_MODERATOR:		
                rank = "Moderator";
                color = "|cff4169E1";
                break;
            case SEC_GAMEMASTER:	
                rank = "GameMaster";
                color = "|cffFFFF00";
                break;
            case SEC_ADMINISTRATOR: 
                rank = "Administrator";
                color = "|cffFF0000";
                break;
            case SEC_CONSOLE:		
                rank = "Console";
                color = "|cffFF0000";
                break;
        }

        message = msg;
        chat_string << "[World]" << " [" << rank << "] " << "[" << color << player->GetName() << "|r]: " << message;

        char mess[255];

        snprintf(mess, 255, chat_string.str().c_str());

        if (message.length() >= 3)
            sWorld->SendGlobalText(mess, NULL);
        else
            player->GetSession()->SendNotification("Your message has to be at least 3 characters longer");

        return true;
   }
};

void AddSC_World_Chat()
{
    new World_Chat;
}