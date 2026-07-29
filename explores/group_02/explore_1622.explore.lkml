# Explore: explore_1622
# Auto-generated LookML Explore File

include: "/views/domain_17/view_04867.view.lkml"
include: "/views/domain_19/view_04869.view.lkml"
include: "/views/domain_20/view_04870.view.lkml"
include: "/views/domain_21/view_04871.view.lkml"

explore: explore_1622 {
  label: "Explore Explore 1622"
  description: "Comprehensive analytics explore joining base view_04867 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04867
  
  always_filter: {
    filters: [view_04867.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04867.created_at_date: "7 days"]
    unless: [view_04867.id, view_04867.status]
  }

  join: view_04869 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04867.user_id} = ${view_04869.id} ;;
    required_joins: []
  }

  join: view_04870 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04867.account_id} = ${view_04870.account_id} ;;
    required_joins: [view_04869]
  }

  join: view_04871 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04867.category} = ${view_04871.category} ;;
  }

  access_filter: {
    field: view_04867.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04867.is_deleted} = false ;;
}
