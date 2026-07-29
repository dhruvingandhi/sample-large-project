# Explore: explore_2444
# Auto-generated LookML Explore File

include: "/views/domain_33/view_07333.view.lkml"
include: "/views/domain_35/view_07335.view.lkml"
include: "/views/domain_36/view_07336.view.lkml"
include: "/views/domain_37/view_07337.view.lkml"

explore: explore_2444 {
  label: "Explore Explore 2444"
  description: "Comprehensive analytics explore joining base view_07333 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07333
  
  always_filter: {
    filters: [view_07333.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07333.created_at_date: "7 days"]
    unless: [view_07333.id, view_07333.status]
  }

  join: view_07335 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07333.user_id} = ${view_07335.id} ;;
    required_joins: []
  }

  join: view_07336 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07333.account_id} = ${view_07336.account_id} ;;
    required_joins: [view_07335]
  }

  join: view_07337 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07333.category} = ${view_07337.category} ;;
  }

  access_filter: {
    field: view_07333.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07333.is_deleted} = false ;;
}
