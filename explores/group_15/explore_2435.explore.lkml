# Explore: explore_2435
# Auto-generated LookML Explore File

include: "/views/domain_06/view_07306.view.lkml"
include: "/views/domain_08/view_07308.view.lkml"
include: "/views/domain_09/view_07309.view.lkml"
include: "/views/domain_10/view_07310.view.lkml"

explore: explore_2435 {
  label: "Explore Explore 2435"
  description: "Comprehensive analytics explore joining base view_07306 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07306
  
  always_filter: {
    filters: [view_07306.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07306.created_at_date: "7 days"]
    unless: [view_07306.id, view_07306.status]
  }

  join: view_07308 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07306.user_id} = ${view_07308.id} ;;
    required_joins: []
  }

  join: view_07309 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07306.account_id} = ${view_07309.account_id} ;;
    required_joins: [view_07308]
  }

  join: view_07310 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07306.category} = ${view_07310.category} ;;
  }

  access_filter: {
    field: view_07306.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07306.is_deleted} = false ;;
}
