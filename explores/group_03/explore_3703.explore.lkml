# Explore: explore_3703
# Auto-generated LookML Explore File

include: "/views/domain_10/view_11110.view.lkml"
include: "/views/domain_12/view_11112.view.lkml"
include: "/views/domain_13/view_11113.view.lkml"
include: "/views/domain_14/view_11114.view.lkml"

explore: explore_3703 {
  label: "Explore Explore 3703"
  description: "Comprehensive analytics explore joining base view_11110 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11110
  
  always_filter: {
    filters: [view_11110.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11110.created_at_date: "7 days"]
    unless: [view_11110.id, view_11110.status]
  }

  join: view_11112 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11110.user_id} = ${view_11112.id} ;;
    required_joins: []
  }

  join: view_11113 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11110.account_id} = ${view_11113.account_id} ;;
    required_joins: [view_11112]
  }

  join: view_11114 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11110.category} = ${view_11114.category} ;;
  }

  access_filter: {
    field: view_11110.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11110.is_deleted} = false ;;
}
