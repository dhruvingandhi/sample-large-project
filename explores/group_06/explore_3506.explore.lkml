# Explore: explore_3506
# Auto-generated LookML Explore File

include: "/views/domain_19/view_10519.view.lkml"
include: "/views/domain_21/view_10521.view.lkml"
include: "/views/domain_22/view_10522.view.lkml"
include: "/views/domain_23/view_10523.view.lkml"

explore: explore_3506 {
  label: "Explore Explore 3506"
  description: "Comprehensive analytics explore joining base view_10519 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10519
  
  always_filter: {
    filters: [view_10519.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10519.created_at_date: "7 days"]
    unless: [view_10519.id, view_10519.status]
  }

  join: view_10521 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10519.user_id} = ${view_10521.id} ;;
    required_joins: []
  }

  join: view_10522 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10519.account_id} = ${view_10522.account_id} ;;
    required_joins: [view_10521]
  }

  join: view_10523 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10519.category} = ${view_10523.category} ;;
  }

  access_filter: {
    field: view_10519.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10519.is_deleted} = false ;;
}
