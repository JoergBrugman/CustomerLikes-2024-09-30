pageextension 50200 "BSCL Book Factbox" extends "BSB Book Factbox"
{
    layout
    {
        addlast(Content)
        {

            field("BSCL No. of Customer Likes"; Rec."BSCL No. of Customer Likes")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. of Customer Likes field.', Comment = '%';
            }
        }
    }
}
//TODO Für Update BSCL No. of Customer Likes sorgen, wenn im Deb. die Fav. Book No. geändert wurde