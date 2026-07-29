# Explore: explore_0159
# Auto-generated LookML Explore File

include: "/views/domain_28/view_00478.view.lkml"
include: "/views/domain_30/view_00480.view.lkml"
include: "/views/domain_31/view_00481.view.lkml"
include: "/views/domain_32/view_00482.view.lkml"

explore: explore_0159 {
  label: "Explore Explore 0159"
  description: "Comprehensive analytics explore joining base view_00478 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00478
  
  always_filter: {
    filters: [view_00478.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00478.created_at_date: "7 days"]
    unless: [view_00478.id, view_00478.status]
  }

  join: view_00480 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00478.user_id} = ${view_00480.id} ;;
    required_joins: []
  }

  join: view_00481 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00478.account_id} = ${view_00481.account_id} ;;
    required_joins: [view_00480]
  }

  join: view_00482 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00478.category} = ${view_00482.category} ;;
  }

  access_filter: {
    field: view_00478.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00478.is_deleted} = false ;;
}
