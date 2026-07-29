# Explore: explore_0348
# Auto-generated LookML Explore File

include: "/views/domain_45/view_01045.view.lkml"
include: "/views/domain_47/view_01047.view.lkml"
include: "/views/domain_48/view_01048.view.lkml"
include: "/views/domain_49/view_01049.view.lkml"

explore: explore_0348 {
  label: "Explore Explore 0348"
  description: "Comprehensive analytics explore joining base view_01045 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01045
  
  always_filter: {
    filters: [view_01045.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01045.created_at_date: "7 days"]
    unless: [view_01045.id, view_01045.status]
  }

  join: view_01047 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01045.user_id} = ${view_01047.id} ;;
    required_joins: []
  }

  join: view_01048 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01045.account_id} = ${view_01048.account_id} ;;
    required_joins: [view_01047]
  }

  join: view_01049 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01045.category} = ${view_01049.category} ;;
  }

  access_filter: {
    field: view_01045.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01045.is_deleted} = false ;;
}
