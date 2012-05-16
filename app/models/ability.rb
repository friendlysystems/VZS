class Ability
  include CanCan::Ability

  ADMIN = User::GROUP[:ADMIN]
  BOARD = User::GROUP[:BOARD]
  MEMBER = User::GROUP[:MEMBER]
  OUTSIDER = User::GROUP[:OUTSIDER]

  def initialize(user)
    user ||= User.new

    if user.group == ADMIN
      can :manage, :all
      return
    end

    article_rules(user)
    comments_rules(user)
    attachments_rules(user)
    user_manager_rules(user)
    user_rules(user)

  end

  def article_rules(user)
    if user.group? BOARD
      can :read, Article, :group => [OUTSIDER, MEMBER, BOARD]
      can :create, Article, :group => [nil, OUTSIDER, MEMBER, BOARD], :user_id => user.id
      can [:update, :save, :destroy], Article, :group => [OUTSIDER, MEMBER, BOARD], :user_id => user.id
    elsif user.group? MEMBER
      can :read, Article, :group => [OUTSIDER, MEMBER]
      can :create, Article, :group => [nil, OUTSIDER, MEMBER], :user_id => user.id
      can [:update, :save, :destroy], Article, :group => [OUTSIDER, MEMBER], :user_id => user.id
    elsif user.group? OUTSIDER
      can :read, Article, :group => OUTSIDER
    else
      can :read, Article, :group => OUTSIDER # neprihlaseni smi cist clanky pro necleny
    end
  end

  def comments_rules(user)
    # komentare
    can :read, Comment
    if [BOARD,MEMBER,OUTSIDER].include? user.group
      # vsichni registrovani smi psat komentare
      can :create, Comment, :article => { :commentable => true }
    end
  end

  def attachments_rules(user)
    can :create, Attachment do |att|
      att.user_id == user.id and
      att.article.group <= user.group
    end
    can [:update, :save, :destroy], Attachment, :user_id => user.id
    if user.group >= BOARD
      can :manage, Attachment
    end
  end

  def user_rules(user)
    can :create, User do |u|
      u.group? OUTSIDER
    end

    # smi zobrazovat pouze sebe (show/index)
    can :read, User, :id => user.id


    if user.group >= MEMBER
      # clenove smi ...
      
      # ... prohlizet seznam clenu
      can :read_members, User
      can :read, User

      # ... upravovat rozsirujici atributy sveho profil
      can :update_extended, Profile, :user_id => user.id

      # menit svuj uzivatelsky profil
      can [:update, :save], User do |u|
        u.id == user.id and
        u.group? user.group
      end
    else
      can [:update, :save], User do |u|
        u.id == user.id and
        u.group? user.group and
        u.profile.birthnumber == user.profile.birthnumber and
        u.profile.birthdate == user.profile.birthdate and
        u.profile.address == user.profile.address
      end
    end
  end

  def user_manager_rules(user)
    if user.group >= BOARD
      # clenove vyboru a vyssi smi spravovat uzivatele a rozsirujici atributy
      # profilu (RC, Adresa, Skupina apod)
      can :manage, User
      can :update_extended, Profile
    end
  end
end
