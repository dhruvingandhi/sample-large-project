# Explore: explore_3173
# Auto-generated LookML Explore File

include: "/views/domain_20/view_09520.view.lkml"
include: "/views/domain_22/view_09522.view.lkml"
include: "/views/domain_23/view_09523.view.lkml"
include: "/views/domain_24/view_09524.view.lkml"

explore: explore_3173 {
  label: "Explore Explore 3173"
  description: "Comprehensive analytics explore joining base view_09520 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09520
  
  always_filter: {
    filters: [view_09520.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09520.created_at_date: "7 days"]
    unless: [view_09520.id, view_09520.status]
  }

  join: view_09522 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09520.user_id} = ${view_09522.id} ;;
    required_joins: []
  }

  join: view_09523 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09520.account_id} = ${view_09523.account_id} ;;
    required_joins: [view_09522]
  }

  join: view_09524 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09520.category} = ${view_09524.category} ;;
  }

  access_filter: {
    field: view_09520.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09520.is_deleted} = false ;;
}
