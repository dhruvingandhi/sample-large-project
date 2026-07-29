# Explore: explore_1472
# Auto-generated LookML Explore File

include: "/views/domain_17/view_04417.view.lkml"
include: "/views/domain_19/view_04419.view.lkml"
include: "/views/domain_20/view_04420.view.lkml"
include: "/views/domain_21/view_04421.view.lkml"

explore: explore_1472 {
  label: "Explore Explore 1472"
  description: "Comprehensive analytics explore joining base view_04417 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04417
  
  always_filter: {
    filters: [view_04417.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04417.created_at_date: "7 days"]
    unless: [view_04417.id, view_04417.status]
  }

  join: view_04419 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04417.user_id} = ${view_04419.id} ;;
    required_joins: []
  }

  join: view_04420 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04417.account_id} = ${view_04420.account_id} ;;
    required_joins: [view_04419]
  }

  join: view_04421 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04417.category} = ${view_04421.category} ;;
  }

  access_filter: {
    field: view_04417.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04417.is_deleted} = false ;;
}
