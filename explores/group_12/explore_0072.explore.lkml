# Explore: explore_0072
# Auto-generated LookML Explore File

include: "/views/domain_17/view_00217.view.lkml"
include: "/views/domain_19/view_00219.view.lkml"
include: "/views/domain_20/view_00220.view.lkml"
include: "/views/domain_21/view_00221.view.lkml"

explore: explore_0072 {
  label: "Explore Explore 0072"
  description: "Comprehensive analytics explore joining base view_00217 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_00217
  
  always_filter: {
    filters: [view_00217.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00217.created_at_date: "7 days"]
    unless: [view_00217.id, view_00217.status]
  }

  join: view_00219 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00217.user_id} = ${view_00219.id} ;;
    required_joins: []
  }

  join: view_00220 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00217.account_id} = ${view_00220.account_id} ;;
    required_joins: [view_00219]
  }

  join: view_00221 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00217.category} = ${view_00221.category} ;;
  }

  access_filter: {
    field: view_00217.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00217.is_deleted} = false ;;
}
