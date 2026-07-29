# Explore: explore_0507
# Auto-generated LookML Explore File

include: "/views/domain_22/view_01522.view.lkml"
include: "/views/domain_24/view_01524.view.lkml"
include: "/views/domain_25/view_01525.view.lkml"
include: "/views/domain_26/view_01526.view.lkml"

explore: explore_0507 {
  label: "Explore Explore 0507"
  description: "Comprehensive analytics explore joining base view_01522 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01522
  
  always_filter: {
    filters: [view_01522.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01522.created_at_date: "7 days"]
    unless: [view_01522.id, view_01522.status]
  }

  join: view_01524 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01522.user_id} = ${view_01524.id} ;;
    required_joins: []
  }

  join: view_01525 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01522.account_id} = ${view_01525.account_id} ;;
    required_joins: [view_01524]
  }

  join: view_01526 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01522.category} = ${view_01526.category} ;;
  }

  access_filter: {
    field: view_01522.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01522.is_deleted} = false ;;
}
