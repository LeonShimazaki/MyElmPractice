addtask : Model -> Html Msg
addtask model =
    Element.layout
        [ Font.size 35
        , Background.color white
        ]
    <|
        --Overall Device size
        Element.column
            [ Element.width fill
            , Element.height fill
            , Background.color lightBlack
            , Border.color blackB
            , Border.width 5
            , centerY
            , centerX
            --, explain Debug.todo
            ]
            --Nav Bar
            [ row
                [ Element.width fill
                , centerX
                , padding 10
                , Border.width 1
                , Background.color white
                , Font.center
                , spacing 10
                ]
                [ link
                    [ Background.color brightGreen
                    , padding 10
                    , Element.width fill
                    , Element.height (px 100)
                    , Font.color white
                    , Border.color brightGreen
                    , Font.center
                    , Border.rounded 5
                    ]
                    { url = "/"
                    , label = Element.text "Home"
                    }
                , Element.image
                    [ Element.width (px 400) ]
                    { src = "src/XXX.png"
                    , description = "XXX logo"
                    }
                , el
                    [ centerX
                    , padding 10
                    , Font.center
                    ]
                    (Element.text "ZZZZ XXXXXXXXX\nHelpdesk: 022-088-XXXX")
                ]

            --Title
            , paragraph
                [ Element.width fill
                , Element.height (px 100)
                , centerX
                , padding 10
                , Border.width 1
                , Background.color brightGreen
                , Font.center
                , Font.size 45
                , Font.bold
                ]
                [ Element.text "Add a new task!" ]

            -- Main Job title
            , column
                [ Element.height fill, Element.width fill]
                [ row
                    [ Element.height (px 70)
                    , Element.width fill
                    ]
                    [ paragraph
                    [ Font.color white
                    , Element.width fill
                    , Element.height (px 50)
                    , padding 10
                    ]
                        [ Element.text "Job Details" ]
                   , link
                        [ Element.width (px 300)
                        , Element.height fill
                        , padding 5
                        , Font.size 40
                        , alignRight
                        , Border.width 1
                        , Background.color brightGreen
                        , Font.center
                        , Events.onClick (Refreshtasklist model.taskData.id)
                        ]
                        { url = "/tasklist"
                        , label = Element.text "Back"
                        }
                    
                    ]
                , Input.text
                    [ Element.width fill
                    , Background.color white
                    ]
                    (options_date model)
                , Input.text
                    [ Element.width fill
                    , Background.color white
                    ]
                    { text = model.postData.task_title
                    , placeholder = Just (Input.placeholder [] (Element.text "Job title"))
                    , onChange = GotJobTitle
                    , label = Input.labelAbove [ Font.size 14 ] (Element.text "")
                    }
                , Input.text
                    [ Element.width fill
                    , Background.color white
                    ]
                    { text = model.postData.location
                    , placeholder = Just (Input.placeholder [] (Element.text "Location"))
                    , onChange = Gotlocation
                    , label = Input.labelAbove [ Font.size 14 ] (Element.text "")
                    }
                , Input.multiline
                    [ Element.width fill
                    , Element.height fill
                    , Background.color white
                    ]
                    { text = model.postData.job_description
                    , placeholder = Just (Input.placeholder [] (Element.text "Job description"))
                    , onChange = GotJobDescription
                    , label = Input.labelAbove [ Font.size 14 ] (Element.text "")
                    , spellcheck = False
                    }
                ]

            --Aside2 client details
            , column [ Element.width fill ]
                [ paragraph
                    [ Font.color white
                    , Element.width fill
                    , Element.height (px 50)
                    , padding 10
                    ]
                    [Element.text "Client Details"]
                , Input.text
                    [ Element.width fill
                    , Element.height fill
                    , Background.color white
                    ]
                    { text = model.postData.contact_first_name
                    , placeholder = Just (Input.placeholder [] (Element.text "First name"))
                    , onChange = GotFname
                    , label = Input.labelAbove [ Font.size 14 ] (Element.text "")
                    }
                , Input.text
                    [ Element.width fill
                    , Element.height fill
                    , Background.color white
                    ]
                    { text = model.postData.contact_last_name 
                    , placeholder = Just (Input.placeholder [] (Element.text "Last name"))
                    , onChange = GotLname
                    , label = Input.labelAbove [ Font.size 14 ] (Element.text "")
                    }
                                , Input.text
                    [ Element.width fill
                    , Element.height fill
                    , Background.color white
                    ]
                    { text = model.postData.email
                    , placeholder = Just (Input.placeholder [] (Element.text "Email"))
                    , onChange = GotEmail
                    , label = Input.labelAbove [ Font.size 14 ] (Element.text "")
                    }
                , Input.text
                    [ Element.width fill
                    , Element.height fill
                    , Background.color white
                    ]
                    { text = model.postData.school_phone
                    , placeholder = Just (Input.placeholder [] (Element.text "Contact phone number"))
                    , onChange = GotPhone
                    , label = Input.labelAbove [ Font.size 14 ] (Element.text "")
                    }
                ]
            --Aside Job Status slider
                       --Job Status
            ,column [spacing 10, Element.width fill]
                [column [Element.width fill]
                    [ row
                        [ Font.color white
                        , Element.width fill
                        , Element.height (px 50)
                        , padding 10
                        ]
                        [ Element.text "Job Status" ]
                    , Input.text
                        [ Element.width fill
                        , Element.height (px 60)
                        , padding 3
                        , Border.width 1
                        , Background.color white
                        ]
                        { text = model.postData.job_status
                        , placeholder = Just (Input.placeholder [] (Element.text "Job Status"))
                        , onChange = GotStatus
                        , label = Input.labelAbove [ Font.size 14 ] (Element.text "")
                        }
                    ]
                --Footer
                , link
                    [ Background.color brightGreen
                    , Element.width fill
                    , Element.height (px 100) 
                    , centerX
                    , padding 10
                    , Font.size 40
                    , Font.color white 
                    , Border.color brightGreen
                    , Font.center
                    , Border.rounded 5
                    , Events.onClick (Sendpost)
                    ]
                    { url = "/"
                    , label = Element.text "+ Add A Task"
                    }
                ]
        ]
