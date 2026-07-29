# Explore: explore_3423
# Auto-generated LookML Explore File

include: "/views/domain_20/view_10270.view.lkml"
include: "/views/domain_22/view_10272.view.lkml"
include: "/views/domain_23/view_10273.view.lkml"
include: "/views/domain_24/view_10274.view.lkml"

explore: explore_3423 {
  label: "Explore Explore 3423"
  description: "Comprehensive analytics explore joining base view_10270 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10270
  
  always_filter: {
    filters: [view_10270.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10270.created_at_date: "7 days"]
    unless: [view_10270.id, view_10270.status]
  }

  join: view_10272 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10270.user_id} = ${view_10272.id} ;;
    required_joins: []
  }

  join: view_10273 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10270.account_id} = ${view_10273.account_id} ;;
    required_joins: [view_10272]
  }

  join: view_10274 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10270.category} = ${view_10274.category} ;;
  }

  access_filter: {
    field: view_10270.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10270.is_deleted} = false ;;
}
