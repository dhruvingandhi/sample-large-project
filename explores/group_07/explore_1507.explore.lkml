# Explore: explore_1507
# Auto-generated LookML Explore File

include: "/views/domain_22/view_04522.view.lkml"
include: "/views/domain_24/view_04524.view.lkml"
include: "/views/domain_25/view_04525.view.lkml"
include: "/views/domain_26/view_04526.view.lkml"

explore: explore_1507 {
  label: "Explore Explore 1507"
  description: "Comprehensive analytics explore joining base view_04522 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04522
  
  always_filter: {
    filters: [view_04522.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04522.created_at_date: "7 days"]
    unless: [view_04522.id, view_04522.status]
  }

  join: view_04524 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04522.user_id} = ${view_04524.id} ;;
    required_joins: []
  }

  join: view_04525 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04522.account_id} = ${view_04525.account_id} ;;
    required_joins: [view_04524]
  }

  join: view_04526 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04522.category} = ${view_04526.category} ;;
  }

  access_filter: {
    field: view_04522.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04522.is_deleted} = false ;;
}
