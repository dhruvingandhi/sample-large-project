# Explore: explore_2530
# Auto-generated LookML Explore File

include: "/views/domain_41/view_07591.view.lkml"
include: "/views/domain_43/view_07593.view.lkml"
include: "/views/domain_44/view_07594.view.lkml"
include: "/views/domain_45/view_07595.view.lkml"

explore: explore_2530 {
  label: "Explore Explore 2530"
  description: "Comprehensive analytics explore joining base view_07591 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07591
  
  always_filter: {
    filters: [view_07591.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07591.created_at_date: "7 days"]
    unless: [view_07591.id, view_07591.status]
  }

  join: view_07593 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07591.user_id} = ${view_07593.id} ;;
    required_joins: []
  }

  join: view_07594 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07591.account_id} = ${view_07594.account_id} ;;
    required_joins: [view_07593]
  }

  join: view_07595 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07591.category} = ${view_07595.category} ;;
  }

  access_filter: {
    field: view_07591.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07591.is_deleted} = false ;;
}
