# Explore: explore_3507
# Auto-generated LookML Explore File

include: "/views/domain_22/view_10522.view.lkml"
include: "/views/domain_24/view_10524.view.lkml"
include: "/views/domain_25/view_10525.view.lkml"
include: "/views/domain_26/view_10526.view.lkml"

explore: explore_3507 {
  label: "Explore Explore 3507"
  description: "Comprehensive analytics explore joining base view_10522 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10522
  
  always_filter: {
    filters: [view_10522.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10522.created_at_date: "7 days"]
    unless: [view_10522.id, view_10522.status]
  }

  join: view_10524 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10522.user_id} = ${view_10524.id} ;;
    required_joins: []
  }

  join: view_10525 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10522.account_id} = ${view_10525.account_id} ;;
    required_joins: [view_10524]
  }

  join: view_10526 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10522.category} = ${view_10526.category} ;;
  }

  access_filter: {
    field: view_10522.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10522.is_deleted} = false ;;
}
