# Explore: explore_3526
# Auto-generated LookML Explore File

include: "/views/domain_29/view_10579.view.lkml"
include: "/views/domain_31/view_10581.view.lkml"
include: "/views/domain_32/view_10582.view.lkml"
include: "/views/domain_33/view_10583.view.lkml"

explore: explore_3526 {
  label: "Explore Explore 3526"
  description: "Comprehensive analytics explore joining base view_10579 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10579
  
  always_filter: {
    filters: [view_10579.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10579.created_at_date: "7 days"]
    unless: [view_10579.id, view_10579.status]
  }

  join: view_10581 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10579.user_id} = ${view_10581.id} ;;
    required_joins: []
  }

  join: view_10582 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10579.account_id} = ${view_10582.account_id} ;;
    required_joins: [view_10581]
  }

  join: view_10583 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10579.category} = ${view_10583.category} ;;
  }

  access_filter: {
    field: view_10579.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10579.is_deleted} = false ;;
}
