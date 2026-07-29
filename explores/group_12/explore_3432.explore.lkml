# Explore: explore_3432
# Auto-generated LookML Explore File

include: "/views/domain_47/view_10297.view.lkml"
include: "/views/domain_49/view_10299.view.lkml"
include: "/views/domain_50/view_10300.view.lkml"
include: "/views/domain_01/view_10301.view.lkml"

explore: explore_3432 {
  label: "Explore Explore 3432"
  description: "Comprehensive analytics explore joining base view_10297 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10297
  
  always_filter: {
    filters: [view_10297.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10297.created_at_date: "7 days"]
    unless: [view_10297.id, view_10297.status]
  }

  join: view_10299 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10297.user_id} = ${view_10299.id} ;;
    required_joins: []
  }

  join: view_10300 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10297.account_id} = ${view_10300.account_id} ;;
    required_joins: [view_10299]
  }

  join: view_10301 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10297.category} = ${view_10301.category} ;;
  }

  access_filter: {
    field: view_10297.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10297.is_deleted} = false ;;
}
