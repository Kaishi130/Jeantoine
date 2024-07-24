--- STEAMODDED HEADER
--- MOD_NAME: Jeantoine
--- MOD_ID: Chicotmod
--- MOD_AUTHOR: [Firch, Kaishi]
--- MOD_DESCRIPTION: Reworks Chicot in a bit more Legendary-worthy way
--- VERSION: 1.0

SMODS.Shader({key = 'negative_blind', path = 'negative_blind.fs'})

SMODS.Joker:take_ownership('chicot', {
	add_to_deck = function(self, card, from_debuff)
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            G.E_MANAGER:add_event(Event({delay = 0.4,
            trigger = 'before',
            func = function()
                G.GAME.blind:disable()
                play_sound('timpani')
            return true end }))
            G.E_MANAGER:add_event(Event({func = function()
                G.GAME.blind:disable()
                G.GAME.negative = true
                ease_background_colour_blind()
                get_blind_main_colour('Boss')
                play_sound('timpani', 1.2)
                delay(0.4)
            return true end }))
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
        end
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not card.getting_sliced and not context.blueprint and context.blind.boss then
            G.E_MANAGER:add_event(Event({func = function()
                G.E_MANAGER:add_event(Event({delay = 0.4,
                trigger = 'before',
                func = function()
                    G.GAME.blind:disable()
                    play_sound('timpani')
                return true end }))
                G.E_MANAGER:add_event(Event({func = function()
                    G.GAME.blind:disable()
                    G.GAME.negative = true
                    ease_background_colour_blind()
                    get_blind_main_colour('Boss')
                    play_sound('timpani', 1.2)
                    delay(0.4)
                return true end }))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
            return true end }))
        end
    end,
    loc_txt =  {
        ['en-us'] = {
            ['name'] = 'Chicot',
            ['text'] = {
                [1] = 'Disables effect of',
                [2] = 'every {C:attention}Boss Blind',
                [3] = 'and inverts debuffs',
                [4] = 'whenever it is possible'
            },
            ['unlock'] = {
                [1] = '{E:1,s:1.3}?????'
            }
        }
    }
})