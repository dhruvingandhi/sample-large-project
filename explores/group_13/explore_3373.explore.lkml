# Explore: explore_3373
# Auto-generated LookML Explore File

include: "/views/domain_20/view_10120.view.lkml"
include: "/views/domain_22/view_10122.view.lkml"
include: "/views/domain_23/view_10123.view.lkml"
include: "/views/domain_24/view_10124.view.lkml"

explore: explore_3373 {
  label: "Explore Explore 3373"
  description: "Comprehensive analytics explore joining base view_10120 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10120
  
  always_filter: {
    filters: [view_10120.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10120.created_at_date: "7 days"]
    unless: [view_10120.id, view_10120.status]
  }

  join: view_10122 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10120.user_id} = ${view_10122.id} ;;
    required_joins: []
  }

  join: view_10123 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10120.account_id} = ${view_10123.account_id} ;;
    required_joins: [view_10122]
  }

  join: view_10124 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10120.category} = ${view_10124.category} ;;
  }

  access_filter: {
    field: view_10120.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10120.is_deleted} = false ;;
}
