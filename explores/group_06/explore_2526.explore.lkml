# Explore: explore_2526
# Auto-generated LookML Explore File

include: "/views/domain_29/view_07579.view.lkml"
include: "/views/domain_31/view_07581.view.lkml"
include: "/views/domain_32/view_07582.view.lkml"
include: "/views/domain_33/view_07583.view.lkml"

explore: explore_2526 {
  label: "Explore Explore 2526"
  description: "Comprehensive analytics explore joining base view_07579 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07579
  
  always_filter: {
    filters: [view_07579.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07579.created_at_date: "7 days"]
    unless: [view_07579.id, view_07579.status]
  }

  join: view_07581 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07579.user_id} = ${view_07581.id} ;;
    required_joins: []
  }

  join: view_07582 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07579.account_id} = ${view_07582.account_id} ;;
    required_joins: [view_07581]
  }

  join: view_07583 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07579.category} = ${view_07583.category} ;;
  }

  access_filter: {
    field: view_07579.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07579.is_deleted} = false ;;
}
