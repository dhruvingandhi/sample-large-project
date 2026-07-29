# Explore: explore_3442
# Auto-generated LookML Explore File

include: "/views/domain_27/view_10327.view.lkml"
include: "/views/domain_29/view_10329.view.lkml"
include: "/views/domain_30/view_10330.view.lkml"
include: "/views/domain_31/view_10331.view.lkml"

explore: explore_3442 {
  label: "Explore Explore 3442"
  description: "Comprehensive analytics explore joining base view_10327 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10327
  
  always_filter: {
    filters: [view_10327.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10327.created_at_date: "7 days"]
    unless: [view_10327.id, view_10327.status]
  }

  join: view_10329 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10327.user_id} = ${view_10329.id} ;;
    required_joins: []
  }

  join: view_10330 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10327.account_id} = ${view_10330.account_id} ;;
    required_joins: [view_10329]
  }

  join: view_10331 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10327.category} = ${view_10331.category} ;;
  }

  access_filter: {
    field: view_10327.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10327.is_deleted} = false ;;
}
