# Explore: explore_0188
# Auto-generated LookML Explore File

include: "/views/domain_15/view_00565.view.lkml"
include: "/views/domain_17/view_00567.view.lkml"
include: "/views/domain_18/view_00568.view.lkml"
include: "/views/domain_19/view_00569.view.lkml"

explore: explore_0188 {
  label: "Explore Explore 0188"
  description: "Comprehensive analytics explore joining base view_00565 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00565
  
  always_filter: {
    filters: [view_00565.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00565.created_at_date: "7 days"]
    unless: [view_00565.id, view_00565.status]
  }

  join: view_00567 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00565.user_id} = ${view_00567.id} ;;
    required_joins: []
  }

  join: view_00568 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00565.account_id} = ${view_00568.account_id} ;;
    required_joins: [view_00567]
  }

  join: view_00569 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00565.category} = ${view_00569.category} ;;
  }

  access_filter: {
    field: view_00565.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00565.is_deleted} = false ;;
}
