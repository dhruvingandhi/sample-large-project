# Explore: explore_3529
# Auto-generated LookML Explore File

include: "/views/domain_38/view_10588.view.lkml"
include: "/views/domain_40/view_10590.view.lkml"
include: "/views/domain_41/view_10591.view.lkml"
include: "/views/domain_42/view_10592.view.lkml"

explore: explore_3529 {
  label: "Explore Explore 3529"
  description: "Comprehensive analytics explore joining base view_10588 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10588
  
  always_filter: {
    filters: [view_10588.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10588.created_at_date: "7 days"]
    unless: [view_10588.id, view_10588.status]
  }

  join: view_10590 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10588.user_id} = ${view_10590.id} ;;
    required_joins: []
  }

  join: view_10591 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10588.account_id} = ${view_10591.account_id} ;;
    required_joins: [view_10590]
  }

  join: view_10592 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10588.category} = ${view_10592.category} ;;
  }

  access_filter: {
    field: view_10588.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10588.is_deleted} = false ;;
}
