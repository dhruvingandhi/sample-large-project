# Explore: explore_1423
# Auto-generated LookML Explore File

include: "/views/domain_20/view_04270.view.lkml"
include: "/views/domain_22/view_04272.view.lkml"
include: "/views/domain_23/view_04273.view.lkml"
include: "/views/domain_24/view_04274.view.lkml"

explore: explore_1423 {
  label: "Explore Explore 1423"
  description: "Comprehensive analytics explore joining base view_04270 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04270
  
  always_filter: {
    filters: [view_04270.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04270.created_at_date: "7 days"]
    unless: [view_04270.id, view_04270.status]
  }

  join: view_04272 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04270.user_id} = ${view_04272.id} ;;
    required_joins: []
  }

  join: view_04273 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04270.account_id} = ${view_04273.account_id} ;;
    required_joins: [view_04272]
  }

  join: view_04274 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04270.category} = ${view_04274.category} ;;
  }

  access_filter: {
    field: view_04270.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04270.is_deleted} = false ;;
}
