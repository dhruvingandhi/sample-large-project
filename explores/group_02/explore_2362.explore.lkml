# Explore: explore_2362
# Auto-generated LookML Explore File

include: "/views/domain_37/view_07087.view.lkml"
include: "/views/domain_39/view_07089.view.lkml"
include: "/views/domain_40/view_07090.view.lkml"
include: "/views/domain_41/view_07091.view.lkml"

explore: explore_2362 {
  label: "Explore Explore 2362"
  description: "Comprehensive analytics explore joining base view_07087 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07087
  
  always_filter: {
    filters: [view_07087.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07087.created_at_date: "7 days"]
    unless: [view_07087.id, view_07087.status]
  }

  join: view_07089 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07087.user_id} = ${view_07089.id} ;;
    required_joins: []
  }

  join: view_07090 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07087.account_id} = ${view_07090.account_id} ;;
    required_joins: [view_07089]
  }

  join: view_07091 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07087.category} = ${view_07091.category} ;;
  }

  access_filter: {
    field: view_07087.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07087.is_deleted} = false ;;
}
