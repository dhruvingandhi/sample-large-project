# Update for 2000 file diff target
# Explore: explore_3438
# Auto-generated LookML Explore File

include: "/views/domain_15/view_10315.view.lkml"
include: "/views/domain_17/view_10317.view.lkml"
include: "/views/domain_18/view_10318.view.lkml"
include: "/views/domain_19/view_10319.view.lkml"

explore: explore_3438 {
  label: "Explore Explore 3438"
  description: "Comprehensive analytics explore joining base view_10315 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10315
  
  always_filter: {
    filters: [view_10315.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10315.created_at_date: "7 days"]
    unless: [view_10315.id, view_10315.status]
  }

  join: view_10317 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10315.user_id} = ${view_10317.id} ;;
    required_joins: []
  }

  join: view_10318 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10315.account_id} = ${view_10318.account_id} ;;
    required_joins: [view_10317]
  }

  join: view_10319 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10315.category} = ${view_10319.category} ;;
  }

  access_filter: {
    field: view_10315.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10315.is_deleted} = false ;;
}
