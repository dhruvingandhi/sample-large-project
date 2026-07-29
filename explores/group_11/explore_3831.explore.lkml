# Explore: explore_3831
# Auto-generated LookML Explore File

include: "/views/domain_44/view_11494.view.lkml"
include: "/views/domain_46/view_11496.view.lkml"
include: "/views/domain_47/view_11497.view.lkml"
include: "/views/domain_48/view_11498.view.lkml"

explore: explore_3831 {
  label: "Explore Explore 3831"
  description: "Comprehensive analytics explore joining base view_11494 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11494
  
  always_filter: {
    filters: [view_11494.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11494.created_at_date: "7 days"]
    unless: [view_11494.id, view_11494.status]
  }

  join: view_11496 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11494.user_id} = ${view_11496.id} ;;
    required_joins: []
  }

  join: view_11497 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11494.account_id} = ${view_11497.account_id} ;;
    required_joins: [view_11496]
  }

  join: view_11498 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11494.category} = ${view_11498.category} ;;
  }

  access_filter: {
    field: view_11494.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11494.is_deleted} = false ;;
}
