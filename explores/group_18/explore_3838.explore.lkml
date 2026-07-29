# Explore: explore_3838
# Auto-generated LookML Explore File

include: "/views/domain_15/view_11515.view.lkml"
include: "/views/domain_17/view_11517.view.lkml"
include: "/views/domain_18/view_11518.view.lkml"
include: "/views/domain_19/view_11519.view.lkml"

explore: explore_3838 {
  label: "Explore Explore 3838"
  description: "Comprehensive analytics explore joining base view_11515 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11515
  
  always_filter: {
    filters: [view_11515.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11515.created_at_date: "7 days"]
    unless: [view_11515.id, view_11515.status]
  }

  join: view_11517 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11515.user_id} = ${view_11517.id} ;;
    required_joins: []
  }

  join: view_11518 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11515.account_id} = ${view_11518.account_id} ;;
    required_joins: [view_11517]
  }

  join: view_11519 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11515.category} = ${view_11519.category} ;;
  }

  access_filter: {
    field: view_11515.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11515.is_deleted} = false ;;
}
