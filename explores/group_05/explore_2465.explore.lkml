# Update for 500 file diff target
# Explore: explore_2465
# Auto-generated LookML Explore File

include: "/views/domain_46/view_07396.view.lkml"
include: "/views/domain_48/view_07398.view.lkml"
include: "/views/domain_49/view_07399.view.lkml"
include: "/views/domain_50/view_07400.view.lkml"

explore: explore_2465 {
  label: "Explore Explore 2465"
  description: "Comprehensive analytics explore joining base view_07396 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07396
  
  always_filter: {
    filters: [view_07396.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07396.created_at_date: "7 days"]
    unless: [view_07396.id, view_07396.status]
  }

  join: view_07398 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07396.user_id} = ${view_07398.id} ;;
    required_joins: []
  }

  join: view_07399 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07396.account_id} = ${view_07399.account_id} ;;
    required_joins: [view_07398]
  }

  join: view_07400 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07396.category} = ${view_07400.category} ;;
  }

  access_filter: {
    field: view_07396.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07396.is_deleted} = false ;;
}
