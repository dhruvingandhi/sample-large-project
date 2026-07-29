# Explore: explore_2322
# Auto-generated LookML Explore File

include: "/views/domain_17/view_06967.view.lkml"
include: "/views/domain_19/view_06969.view.lkml"
include: "/views/domain_20/view_06970.view.lkml"
include: "/views/domain_21/view_06971.view.lkml"

explore: explore_2322 {
  label: "Explore Explore 2322"
  description: "Comprehensive analytics explore joining base view_06967 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06967
  
  always_filter: {
    filters: [view_06967.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06967.created_at_date: "7 days"]
    unless: [view_06967.id, view_06967.status]
  }

  join: view_06969 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06967.user_id} = ${view_06969.id} ;;
    required_joins: []
  }

  join: view_06970 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06967.account_id} = ${view_06970.account_id} ;;
    required_joins: [view_06969]
  }

  join: view_06971 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06967.category} = ${view_06971.category} ;;
  }

  access_filter: {
    field: view_06967.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06967.is_deleted} = false ;;
}
