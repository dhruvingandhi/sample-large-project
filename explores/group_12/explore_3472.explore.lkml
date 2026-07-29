# Explore: explore_3472
# Auto-generated LookML Explore File

include: "/views/domain_17/view_10417.view.lkml"
include: "/views/domain_19/view_10419.view.lkml"
include: "/views/domain_20/view_10420.view.lkml"
include: "/views/domain_21/view_10421.view.lkml"

explore: explore_3472 {
  label: "Explore Explore 3472"
  description: "Comprehensive analytics explore joining base view_10417 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10417
  
  always_filter: {
    filters: [view_10417.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10417.created_at_date: "7 days"]
    unless: [view_10417.id, view_10417.status]
  }

  join: view_10419 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10417.user_id} = ${view_10419.id} ;;
    required_joins: []
  }

  join: view_10420 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10417.account_id} = ${view_10420.account_id} ;;
    required_joins: [view_10419]
  }

  join: view_10421 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10417.category} = ${view_10421.category} ;;
  }

  access_filter: {
    field: view_10417.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10417.is_deleted} = false ;;
}
