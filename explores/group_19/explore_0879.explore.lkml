# Explore: explore_0879
# Auto-generated LookML Explore File

include: "/views/domain_38/view_02638.view.lkml"
include: "/views/domain_40/view_02640.view.lkml"
include: "/views/domain_41/view_02641.view.lkml"
include: "/views/domain_42/view_02642.view.lkml"

explore: explore_0879 {
  label: "Explore Explore 0879"
  description: "Comprehensive analytics explore joining base view_02638 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02638
  
  always_filter: {
    filters: [view_02638.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02638.created_at_date: "7 days"]
    unless: [view_02638.id, view_02638.status]
  }

  join: view_02640 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02638.user_id} = ${view_02640.id} ;;
    required_joins: []
  }

  join: view_02641 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02638.account_id} = ${view_02641.account_id} ;;
    required_joins: [view_02640]
  }

  join: view_02642 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02638.category} = ${view_02642.category} ;;
  }

  access_filter: {
    field: view_02638.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02638.is_deleted} = false ;;
}
