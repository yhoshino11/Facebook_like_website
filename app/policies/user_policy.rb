class UserPolicy
  attr_reader :user, :target

  def initialize(user, target)
    @user = user
    @target = target
  end

  def me?
    @user == @target
  end

  def friends?
    @user.friends_with?(@target)
  end

  def requested?
    @user.requested_friends.include?(@target)
  end

  def pending?
    @user.pending_friends.include?(@target)
  end

  def can_see?
    @user == @target || @user.friends_with?(@target) || @target.profile.f_list_privacy
  end

  def twitter?
    @target.profile.twitter.present?
  end

  def skype?
    @target.profile.skype.present?
  end

  def lctv?
    @target.profile.livecodingtv.present?
  end

  def github?
    @target.profile.github.present?
  end

  def bitbucket?
    @target.profile.bitbucket.present?
  end

  def with_profile?
    @target.profile.present?
  end

  def other?
    @user != @target
  end
end
